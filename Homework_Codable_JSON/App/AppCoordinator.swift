//
//  AppCoordinator.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    weak var parent: Coordinator? = nil
    var childs: [Coordinator] = []
    var uiWindow: UIWindow? = nil

    private var navController: UINavigationController

    init(controller: UINavigationController = UINavigationController()) {
        navController = controller
    }

    func initScene(scene: UIWindowScene) {
        uiWindow = UIWindow.init(windowScene: scene)
    }

    func start() {
        //navController.delegate = self
        uiWindow?.rootViewController = navController

        let startUpCoordinator = StartUpCoordinator(parent: self, navController: navController)
        startUpCoordinator.start()

        uiWindow?.makeKeyAndVisible()
    }
}
