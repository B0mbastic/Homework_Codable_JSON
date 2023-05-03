//
//  StartUpInteractor.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation

class StartUpInteractor {
    private let storage: LocalDataStorage
    private let presenter: StartUpPresenter

    init(storage: LocalDataStorage, presenter: StartUpPresenter) {
        self.storage = storage
        self.presenter = presenter
    }

    func checkStoredSection() {
        let storedSectionId = storage.checkSection()
        print(storedSectionId)
        presenter.sectionCheckResults(results: storedSectionId)
    }
    
    func setStoredSection(sectionId: Int) {
        storage.setSection(sectionId: sectionId)
        presenter.sectionCheckResults(results: sectionId)
    }
}
