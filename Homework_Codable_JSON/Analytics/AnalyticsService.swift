//
//  AnalyticsService.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 06.05.2023.
//


import Foundation

protocol AnalyticsService {
    func logEvent(name: String, parameters: [String : Any]?)
}
