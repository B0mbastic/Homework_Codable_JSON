//
//  EpisodesCoordinator.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation
import UIKit

class EpisodesCoordinator: Coordinator {
    var parent: Coordinator?
    var childs: [Coordinator] = []

    private let navController: UINavigationController

    init(navController: UINavigationController, parent: Coordinator? = nil) {
        self.navController = navController
    }

    func start() {
        let controller = EpisodesViewController()
        // Эту строку закомментировал, так как задание было переделать под архитектуру Cleanswift только один контроллер )
        //controller.coordinator = self
        navController.pushViewController(controller, animated: true)
    }
}
