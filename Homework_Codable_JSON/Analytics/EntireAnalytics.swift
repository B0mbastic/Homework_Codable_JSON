//
//  Analytics.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 06.05.2023.
//

import Foundation
import FirebaseAnalytics


struct EntireAnalytics: AnalyticsService {

    func logEvent(name: String, parameters: [String : Any]?) {
        Analytics.logEvent(name, parameters: parameters)
    }
}
