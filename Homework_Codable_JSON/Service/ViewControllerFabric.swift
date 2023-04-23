//
//  ViewControllerFabric.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 24.04.2023.
//

import Foundation
import UIKit

protocol DataViewControllerFabricMethod {
    func buildViewController(dataViewControllerType: DataViewControllerType) -> UIViewController?
}

struct DataViewControllerFabric: DataViewControllerFabricMethod {
    func buildViewController(dataViewControllerType: DataViewControllerType) -> UIViewController? {
        switch dataViewControllerType {
        case .characters:
            return CharactersViewController()
        case .locations:
            return LocationsViewController()
        case .episodes:
            return EpisodesViewController()
        }
    }
}
