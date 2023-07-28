//
//  DataBuilder.swift
//  AppStoreLayout
//
//  Created by Viktor Golovach on 27.07.2023.
//

import UIKit

struct DataBuilder {
    static func getBigAppsData() -> [AppModel] {
        return [
            AppModel(
                title: "App Store",
                subtitle: "Best apps inside!",
                mainImage: UIImage(named: "appStoreBig")!,
                logoImage: UIImage(named: "appStoreSmall")!),
            AppModel(
                title: "Apple Music",
                subtitle: "Discover world hits and songs!",
                mainImage: UIImage(named: "musicBig")!,
                logoImage: UIImage(named: "musicSmall")!),
            AppModel(
                title: "Arcade",
                subtitle: "Dive into best games and apps",
                mainImage: UIImage(named: "arcadeBig")!,
                logoImage: UIImage(named: "arcadeSmall")!),
            AppModel(
                title: "AppleTV",
                subtitle: "Watch latest movies with Apple TV",
                mainImage: UIImage(named: "tvBig")!,
                logoImage: UIImage(named: "tvSmall")!),
        ]
    }
    
    static func getMiddleAppsData() -> [AppModel] {
        return [
            AppModel(
                title: "Disney",
                subtitle: "Best moview and cartoons inside!",
                mainImage: UIImage(named: "disneyApp")!,
                logoImage: UIImage(named: "disneyApp")!),
            AppModel(
                title: "Facebook",
                subtitle: "Find new friends",
                mainImage: UIImage(named: "facebookApp")!,
                logoImage: UIImage(named: "facebookApp")!),
            AppModel(
                title: "Gmail",
                subtitle: "Emails in your pocket",
                mainImage: UIImage(named: "gmailApp")!,
                logoImage: UIImage(named: "gmailApp")!),
            AppModel(
                title: "Hulu",
                subtitle: "Just hulu app",
                mainImage: UIImage(named: "huluApp")!,
                logoImage: UIImage(named: "huluApp")!),
            AppModel(
                title: "Microsoft",
                subtitle: "All 365 services in one app",
                mainImage: UIImage(named: "microsoftApp")!,
                logoImage: UIImage(named: "microsoftApp")!)
        ]
    }
    
    static func getSmallAppsData() -> [AppModel] {
        return [
            AppModel(
                title: "Netflix",
                subtitle: "Best moview and cartoons inside!",
                mainImage: UIImage(named: "netflixApp")!,
                logoImage: UIImage(named: "netflixApp")!),
            AppModel(
                title: "Spotify",
                subtitle: "Find new Music",
                mainImage: UIImage(named: "spotifyApp")!,
                logoImage: UIImage(named: "spotifyApp")!),
            AppModel(
                title: "TikTok",
                subtitle: "Waste your time",
                mainImage: UIImage(named: "TikTokApp")!,
                logoImage: UIImage(named: "TikTokApp")!),
            AppModel(
                title: "X",
                subtitle: "Elon comunity",
                mainImage: UIImage(named: "twitterApp")!,
                logoImage: UIImage(named: "twitterApp")!),
            AppModel(
                title: "WhatsApp",
                subtitle: "Chat, call, video call",
                mainImage: UIImage(named: "whatsApp")!,
                logoImage: UIImage(named: "whatsApp")!)
        ]
    }
    
}
