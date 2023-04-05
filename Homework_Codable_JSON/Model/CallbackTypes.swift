//
//  CallbackTypes.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 03.04.2023.
//

import Foundation

typealias CharactersCallback = (Result<Array<CartoonCharacter>, NetworkError>) -> Void
typealias LocationsCallback = (Result<Array<CartoonLocation>, NetworkError>) -> Void
typealias EpisodesCallback = (Result<Array<CartoonEpisode>, NetworkError>) -> Void
typealias CharacterCallback = (Result<CartoonCharacter, NetworkError>) -> Void
