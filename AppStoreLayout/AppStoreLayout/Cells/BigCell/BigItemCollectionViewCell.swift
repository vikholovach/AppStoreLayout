//
//  BigItemCollectionViewCell.swift
//  AppStoreLayout
//
//  Created by Viktor Golovach on 27.07.2023.
//

import UIKit

class BigItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var appImageView: UIImageView!
    @IBOutlet weak var appLogogImageView: UIImageView!
    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var smallTitleLabel: UILabel!
    @IBOutlet weak var smallDescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.appImageView.layer.cornerRadius = 16
        self.getButton.layer.cornerRadius = self.getButton.frame.height / 2
        self.appLogogImageView.layer.cornerRadius = 4
    }
    
    private func setUI() {
        self.getButton.backgroundColor = .systemGray.withAlphaComponent(0.5)
    }
    
    
}
