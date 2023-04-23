//
//  UrlSessionNetwokLayer.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 04.04.2023.
//

import Foundation

struct UrlSessionNetworkLayer: NetworkLayer {
    
    private let baseUrl = "https://rickandmortyapi.com/api"
    
    func getCharacters(callback: @escaping CharactersCallback)  {
        let urlRequest = URLRequest(url: URL(string: "\(baseUrl)/character")!)
        URLSession.shared.dataTask(with: urlRequest) { data , response, error in
            if error != nil {
                callback(.failure(.customError("Error during request")))
                return
            }
            
            if data == nil {
                callback(.failure(.emptyData))
                return
            }
            
            let response = try? JSONDecoder().decode(Characters.self, from: data!)
            if response == nil {
                callback(.failure(.wrongJson))
            }
            
            let mapped = response!.results.map { character in
                CartoonCharacter(
                    id: character.id,
                    name: character.name,
                    status: character.status.rawValue,
                    gender: character.gender.rawValue,
                    url: character.url)
            }
            callback(.success(mapped))
        }.resume()
    }
    
//    func getImage(url: String, callback: @escaping ImageCallback)  {
//        let urlRequest = URLRequest(url: URL(string: url)!)
//        URLSession.shared.dataTask(with: urlRequest) { data , response, error in
//            if error != nil {
//                callback(.failure(.customError("Error during request")))
//                return
//            }
//            
//            if data == nil {
//                callback(.failure(.emptyData))
//                return
//            }
//            
////            let response = try? JSONDecoder().decode(Characters.self, from: data!)
////            if response == nil {
////                callback(.failure(.wrongJson))
////            }
////
////            let mapped = response!.results.map { character in
////                CartoonCharacter(
////                    id: character.id,
////                    name: character.name,
////                    status: character.status.rawValue,
////                    gender: character.gender.rawValue,
////                    url: character.url)
////            }
//            callback(.success(data))
//        }.resume()
//    }
    
    func getLocations(callback: @escaping LocationsCallback)  {
        let urlRequest = URLRequest(url: URL(string: "\(baseUrl)/location")!)
        URLSession.shared.dataTask(with: urlRequest) { data , response, error in
            if error != nil {
                callback(.failure(.customError("Error during request")))
                return
            }
            
            if data == nil {
                callback(.failure(.emptyData))
                return
            }
            
            let response = try? JSONDecoder().decode(Locations.self, from: data!)
            if response == nil {
                callback(.failure(.wrongJson))
            }
            
            let mapped = response!.results.map { location in
                CartoonLocation(
                    id: location.id,
                    name: location.name,
                    type: location.type,
                    dimension: location.dimension
                )
            }
            callback(.success(mapped))
        }.resume()
    }
    
    func getEpisodes(callback: @escaping EpisodesCallback)  {
        let urlRequest = URLRequest(url: URL(string: "\(baseUrl)/episode")!)
        URLSession.shared.dataTask(with: urlRequest) { data , response, error in
            if error != nil {
                callback(.failure(.customError("Error during request")))
                return
            }
            
            if data == nil {
                callback(.failure(.emptyData))
                return
            }
            
            let response = try? JSONDecoder().decode(Episodes.self, from: data!)
            if response == nil {
                callback(.failure(.wrongJson))
            }
            
            let mapped = response!.results.map { episode in
                CartoonEpisode(
                    id: episode.id,
                    name: episode.name,
                    episode: episode.episode,
                    airdate: episode.airDate)
            }
            callback(.success(mapped))
        }.resume()
    }
}
