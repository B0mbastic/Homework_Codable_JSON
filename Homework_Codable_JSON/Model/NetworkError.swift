//
//  NetworkError.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.04.2023.
//

import Foundation

enum NetworkError: Error {
    case customError(String)
    case emptyData
    case wrongJson
}
