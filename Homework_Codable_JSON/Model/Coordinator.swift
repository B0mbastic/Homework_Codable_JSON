//
//  Coordinator.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation

protocol Coordinator: AnyObject {
    var parent: Coordinator? { set get }
    var childs: [Coordinator] { set get }

    func start()
}

protocol Coordinatable {
    var coordinator: Coordinator? { get set }
}

