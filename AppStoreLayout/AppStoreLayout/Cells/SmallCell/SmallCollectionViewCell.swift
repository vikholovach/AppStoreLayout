//
//  SmallCollectionViewCell.swift
//  AppStoreLayout
//
//  Created by Viktor Golovach on 27.07.2023.
//

import UIKit

class SmallCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var getButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.getButton.layer.cornerRadius = self.getButton.frame.height / 2
        self.logoImageView.layer.cornerRadius = 4
    }
    
    private func setUI() {
        self.getButton.backgroundColor = .systemGray.withAlphaComponent(0.3)
    }

}
