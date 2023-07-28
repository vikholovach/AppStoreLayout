//
//  MediumTitleCollectionViewCell.swift
//  AppStoreLayout
//
//  Created by Viktor Golovach on 27.07.2023.
//

import UIKit

class MediumTitleCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var lineView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.lineView.alpha = 0.3
    }

}
