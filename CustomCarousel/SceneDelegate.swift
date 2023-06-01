//
//  SceneDelegate.swift
//  CustomCarousel
//
//  Created by Ирина Кольчугина on 01.06.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = CarouselExampleVC()
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

