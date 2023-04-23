//
//  DataViewController.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 24.04.2023.
//

import Foundation
import UIKit

protocol DataViewController {
    func getData()
}

final class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataViewController {
    
    private lazy var dataTable: UITableView = {
        let Table = UITableView(frame: view.bounds, style: .plain)
        Table.register(TableCell.self, forCellReuseIdentifier: identifier)
        Table.delegate = self
        Table.dataSource = self
        Table.rowHeight = 80
        return Table
    }()
    
    let identifier = "cellID"
    private var selectedId: Int = -1
    private var dataArray: [CartoonCharacter] = []
    private let networkLayer: NetworkLayer = UrlSessionNetworkLayer()
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(dataTable)
        dataTable.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getData()
    }
    
    func getData() {
        networkLayer.getCharacters { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let requestError):
                    self.processError(error: requestError)
                case .success(let dataArray):
                    self.dataArray = dataArray
                    self.dataTable.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell
        cell?.itemNameLabel.text = dataArray[indexPath.row].name
        //cell?.characterPhoto.image = characters[indexPath.row].url
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterController = CharacterViewController()
        characterController.characterName = dataArray[indexPath.row].name
        characterController.characterStatus = dataArray[indexPath.row].status
        characterController.characterGender = dataArray[indexPath.row].gender
        
        navigationController?.pushViewController(characterController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                   section: Int) -> String? {
        return "Characters of Rick nad Morty:"
    }
    
    private func processError(error: NetworkError) {
        print(error)
    }
    
}

final class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataViewController {
    
    private lazy var dataTable: UITableView = {
        let Table = UITableView(frame: view.bounds, style: .plain)
        Table.register(TableCell.self, forCellReuseIdentifier: identifier)
        Table.delegate = self
        Table.dataSource = self
        Table.rowHeight = 80
        return Table
    }()
    
    let identifier = "cellID"
    private var selectedId: Int = -1
    private var dataArray: [CartoonLocation] = []
    private let networkLayer: NetworkLayer = UrlSessionNetworkLayer()
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(dataTable)
        dataTable.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getData()
    }
    
    func getData() {
        networkLayer.getLocations { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let requestError):
                    self.processError(error: requestError)
                case .success(let dataArray):
                    self.dataArray = dataArray
                    self.dataTable.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell
        cell?.itemNameLabel.text = dataArray[indexPath.row].name
        //cell?.characterPhoto.image = characters[indexPath.row].url
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let locationController = LocationViewController()
        locationController.locationName = dataArray[indexPath.row].name
        locationController.locationType = dataArray[indexPath.row].type
        locationController.locationDimension = dataArray[indexPath.row].dimension
        navigationController?.pushViewController(locationController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                   section: Int) -> String? {
        return "Locations of Rick nad Morty:"
    }
    
    private func processError(error: NetworkError) {
        print(error)
    }
}

final class EpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, DataViewController {
    
    private lazy var dataTable: UITableView = {
        let Table = UITableView(frame: view.bounds, style: .plain)
        Table.register(TableCell.self, forCellReuseIdentifier: identifier)
        Table.delegate = self
        Table.dataSource = self
        Table.rowHeight = 80
        return Table
    }()
    
    let identifier = "cellID"
    private var selectedId: Int = -1
    private var dataArray: [CartoonEpisode] = []
    private let networkLayer: NetworkLayer = UrlSessionNetworkLayer()
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(dataTable)
        dataTable.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        getData()
    }
    
    func getData() {
        networkLayer.getEpisodes { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let requestError):
                    self.processError(error: requestError)
                case .success(let dataArray):
                    self.dataArray = dataArray
                    self.dataTable.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell
        cell?.itemNameLabel.text = dataArray[indexPath.row].name
        //cell?.characterPhoto.image = characters[indexPath.row].url
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeController = EpisodeViewController()
        episodeController.episodeName = dataArray[indexPath.row].name
        episodeController.episodeCode = dataArray[indexPath.row].episode
        episodeController.episodeAirDate = dataArray[indexPath.row].airdate
        navigationController?.pushViewController(episodeController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                   section: Int) -> String? {
        return "Episodes of Rick nad Morty:"
    }
    
    private func processError(error: NetworkError) {
        print(error)
    }
}

