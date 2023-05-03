//
//  StartUpPresenter.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation

class StartUpPresenter {
    private let view: StartUpViewController

    init(view: StartUpViewController) {
        self.view = view
    }

    func sectionCheckResults(results: Int) {
        view.setCurrentSection(sectionId: results)
    }
}
