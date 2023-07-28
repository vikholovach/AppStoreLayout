//
//  MediumCollectionViewCell.swift
//  AppStoreLayout
//
//  Created by Viktor Golovach on 27.07.2023.
//

import UIKit

class MediumCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var appLogo: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var getButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.getButton.layer.cornerRadius = self.getButton.frame.height / 2
        self.appLogo.layer.cornerRadius = 4
    }
    
    private func setUI() {
        self.getButton.backgroundColor = .systemGray.withAlphaComponent(0.3)
        self.lineView.alpha = 0.3
    }

}
