//
//  Configurator.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation
import UIKit

class Configurator {
    static let shared = Configurator()

    private init() { }

    func configure(controller: UIViewController) {
        if let startUpController = controller as? StartUpViewController {
            let presenter = StartUpPresenter(view: startUpController)

            let storage = LocalDataStorage()
            let interactor = StartUpInteractor(storage: storage, presenter: presenter)

            startUpController.interactor = interactor
        }
    }
}

