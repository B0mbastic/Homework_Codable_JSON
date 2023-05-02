//
//  LocalDataStorage.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation

struct LocalDataStorage {
    func checkLogin() -> Bool {
        return UserDefaults.standard.bool(forKey: "login")
    }

    func login() {
        UserDefaults.standard.set(true, forKey: "login")
    }
}
