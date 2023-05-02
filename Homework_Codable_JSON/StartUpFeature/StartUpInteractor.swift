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

    func checkLogin() {
        let isLogedIn = storage.checkLogin()
        presenter.onLoginCheckResults(results: isLogedIn)
    }
}
