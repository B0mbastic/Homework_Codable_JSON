//
//  StartUpCoordinator.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation
import UIKit

class StartUpCoordinator: Coordinator {
    weak var parent: Coordinator?
    var childs: [Coordinator] = []

    private var navController: UINavigationController?

    init(parent: Coordinator? = nil, navController: UINavigationController? = nil) {
        self.parent = parent
        self.navController = navController
    }

    func start() {
        let controller = StartUpViewController()
        controller.coordinator = self
        navController?.pushViewController(controller, animated: true)
    }

    func navigateToCharacters() {
        let coordinator = CharactersCoordinator(
            navController: navController!,
            parent: self
        )
        coordinator.start()
    }

    func navigateToLocations() {
        let coordinator = LocationsCoordinator(
            navController: navController!,
            parent: self
        )
        coordinator.start()
    }
    
    func navigateToEpisodes() {
        let coordinator = EpisodesCoordinator(
            navController: navController!,
            parent: self
        )
        coordinator.start()
    }
}
