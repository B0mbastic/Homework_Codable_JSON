//
//  LocalDataStorage.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.05.2023.
//

import Foundation

struct LocalDataStorage {
    func checkSection() -> Int {
        return UserDefaults.standard.integer(forKey: "storedSection")
    }

    func setSection(sectionId: Int) {
        print("writing section: \(sectionId)")
        UserDefaults.standard.set(sectionId, forKey: "storedSection")
    }
}
