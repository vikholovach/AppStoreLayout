//
//  AppStoreViewController.swift
//  AppStoreLayout
//
//  Created by Viktor Golovach on 27.07.2023.
//

import UIKit

class AppStoreViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Data Source
    private var dataSource: UICollectionViewDiffableDataSource<Sections, AppModel>! = nil
    
    private var bigAppsDataSource = [AppModel]()
    private var mediumAppsDataSource = [AppModel]()
    private var mediumTitleAppsDataSource = [AppModel]()
    private var smallTitleAppsDataSource = [AppModel]()
    private var smallAppsDataSource = [AppModel]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        initCollectionView()
        initData()
    }
    
    
    //MARK: - Methods
    private func initData() {
        self.bigAppsDataSource = DataBuilder.getBigAppsData()
        self.mediumAppsDataSource = DataBuilder.getMiddleAppsData()
        self.mediumTitleAppsDataSource = [AppModel(title: "Must-Use Apps", subtitle: "", mainImage: UIImage(), logoImage: UIImage())]
        self.smallTitleAppsDataSource = [AppModel(title: "Today Best Apps", subtitle: "", mainImage: UIImage(), logoImage: UIImage())]
        self.smallAppsDataSource = DataBuilder.getSmallAppsData()
        initDataSource()
        reloadData()
    }
    
    private func setUI() {
        self.title = "App Store"
        self.view.backgroundColor = .black
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .semibold)]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
    
    
    private func initCollectionView() {
        collectionView.register(UINib(nibName: "BigItemCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BigItemCollectionViewCell")
        collectionView.register(UINib(nibName: "MediumCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MediumCollectionViewCell")
        collectionView.register(UINib(nibName: "MediumTitleCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MediumTitleCollectionViewCell")
        collectionView.register(UINib(nibName: "SmallCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SmallCollectionViewCell")
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.delegate = self
        collectionView.collectionViewLayout = createLayout()
    }
    
    private func initDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, model -> UICollectionViewCell? in
                let section = Sections(rawValue: indexPath.section)!
                switch section {
                case .big:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BigItemCollectionViewCell", for: indexPath) as? BigItemCollectionViewCell else { return UICollectionViewCell() }
                    cell.appImageView.image = model.mainImage
                    cell.appLogogImageView.image = model.logoImage
                    cell.titleLabel.text = model.title
                    cell.descriptionLabel.text = model.subtitle
                    cell.smallTitleLabel.text = model.title
                    cell.smallDescriptionLabel.text = model.subtitle
                    return cell

                case .medium:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediumCollectionViewCell", for: indexPath) as? MediumCollectionViewCell else { return UICollectionViewCell() }
                    cell.appLogo.image = model.logoImage
                    cell.titleLabel.text = model.title
                    cell.subtitleLabel.text = model.subtitle
                    return cell
                    
                case .mediumTitle:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediumTitleCollectionViewCell", for: indexPath) as? MediumTitleCollectionViewCell else { return UICollectionViewCell() }
                    cell.titleLabel.text = model.title
                    return cell
                case .smallTitle:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MediumTitleCollectionViewCell", for: indexPath) as? MediumTitleCollectionViewCell else { return UICollectionViewCell() }
                    cell.titleLabel.text = model.title
                    return cell
                case .small:
                    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SmallCollectionViewCell", for: indexPath) as? SmallCollectionViewCell else { return UICollectionViewCell() }
                    cell.logoImageView.image = model.logoImage
                    cell.titleLabel.text = model.title
                    cell.descriptionLabel.text = model.subtitle
                    return cell
                }
            })
    }
    
    private func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Sections, AppModel>()
        Sections.allCases.forEach { (sectionKind) in
            switch sectionKind {
            case .big:
                snapshot.appendSections([sectionKind])
                snapshot.appendItems(bigAppsDataSource)
                dataSource.apply(snapshot, animatingDifferences: false)
            case .medium:
                snapshot.appendSections([sectionKind])
                snapshot.appendItems(mediumAppsDataSource)
                dataSource.apply(snapshot, animatingDifferences: false)
            case .mediumTitle:
                snapshot.appendSections([sectionKind])
                snapshot.appendItems(mediumTitleAppsDataSource)
                dataSource.apply(snapshot, animatingDifferences: false)
            case .smallTitle:
                snapshot.appendSections([sectionKind])
                snapshot.appendItems(smallTitleAppsDataSource)
                dataSource.apply(snapshot, animatingDifferences: false)
            case .small:
                snapshot.appendSections([sectionKind])
                snapshot.appendItems(smallAppsDataSource)
                dataSource.apply(snapshot, animatingDifferences: false)
            }
        }
    }

    
    
}


//MARK: - CollectionView Layouts
extension AppStoreViewController {
    // MARK: - Setup Layout
    private func createLayout() -> UICollectionViewLayout {
        
        
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, _) -> NSCollectionLayoutSection? in
            let section = Sections(rawValue: sectionIndex)!
            switch section {
            case .big:
                return self.createTopSection()
            case .medium:
                return self.createMidleSectionWith(height: 0.35)
            case .mediumTitle:
                return self.createTitleSection()
            case .smallTitle:
                return self.createTitleSection()
            case .small:
                return self.createMidleSectionWith(height: 0.2)
            }
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        layout.configuration = config
        
        return layout
    }
    
    private func createTopSection() -> NSCollectionLayoutSection {
        // section -> groups -> items -> size
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.7))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let spacing = CGFloat(16)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: spacing,
            bottom: 0,
            trailing: spacing)
        section.orthogonalScrollingBehavior = .groupPagingCentered

        return section
    }
    
    private func createTitleSection() -> NSCollectionLayoutSection {
        // section -> groups -> items -> size
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(0.1))
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item])
        
        let spacing = CGFloat(16)
        group.interItemSpacing = .fixed(spacing)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = spacing
        section.contentInsets = NSDirectionalEdgeInsets(
            top: spacing,
            leading: spacing,
            bottom: 0,
            trailing: spacing)

        return section
    }
    
    
    private func createMidleSectionWith(height: CGFloat) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(
            top: 8,
            leading: 8,
            bottom: 8,
            trailing: 8)
        
        let layoutGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(height))
         
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: layoutGroupSize,
            subitem: layoutItem,
            count: 2)
        
        let spacing = CGFloat(16)
        let layoutSection = NSCollectionLayoutSection(group: group)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(
            top: spacing,
            leading: spacing,
            bottom: 0,
            trailing: spacing)
        
        return layoutSection
    }
}

//MARK: - UICollectionViewDelegate
extension AppStoreViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
