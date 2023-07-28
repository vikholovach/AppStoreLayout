//
//  AppStoreModels.swift
//  AppStoreLayout
//
//  Created by Viktor Golovach on 27.07.2023.
//

import UIKit

//MARK: - Model to show data
struct AppModel: Hashable  {
    let title: String
    let subtitle: String
    let mainImage: UIImage
    let logoImage: UIImage
}

//MARK: Type of sections in collectionView
enum Sections:  Int, CaseIterable {
    case big, mediumTitle, medium, smallTitle, small

}
