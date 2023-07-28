//
//  AppStoreModels.swift
//  AppStoreLayout
//
//  Created by Viktor Golovach on 27.07.2023.
//

import UIKit

struct AppModel: Hashable  {
    let title: String
    let subtitle: String
    let mainImage: UIImage
    let logoImage: UIImage
}


enum Sections:  Int, CaseIterable {
    case big, mediumTitle, medium, smallTitle, small

}
