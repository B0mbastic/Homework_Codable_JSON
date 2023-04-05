//
//  NetworkLayer.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.04.2023.
//

import Foundation

protocol NetworkLayer {
    func getCharacters(callback: @escaping CharactersCallback) -> Void
    func getLocations(callback: @escaping LocationsCallback) -> Void
    func getEpisodes(callback: @escaping EpisodesCallback) -> Void
    //func getCharacter(id: Int) async -> Result<CartoonCharacter, NetworkError>
}
