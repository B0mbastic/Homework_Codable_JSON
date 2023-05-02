
//
//  CharactersViewController.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 04.04.2023.
//

import UIKit
import SnapKit

class StartUpViewController: UIViewController {
    
    var coordinator: Coordinator?
    var startUpCoordinator: StartUpCoordinator? { coordinator as? StartUpCoordinator }
    var interactor: StartUpInteractor?
    
    private lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.text = "Rick and Morty"
        return label
    }()
    private lazy var loadCharactersButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.layer.zPosition = 5
        button.setTitle("Load characters", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showCharacters), for: .touchUpInside)
        return button
    }()
    
    private lazy var loadLocationsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.layer.zPosition = 5
        button.setTitle("Load locations", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showLocations), for: .touchUpInside)
        return button
    }()
    
    private lazy var loadEpisodesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.layer.zPosition = 5
        button.setTitle("Load episodes", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showEpisodes), for: .touchUpInside)
        return button
    }()
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(100)
        }
        view.addSubview(loadCharactersButton)
        loadCharactersButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(mainLabel.snp.bottom).offset(50)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        view.addSubview(loadLocationsButton)
        loadLocationsButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loadCharactersButton.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        view.addSubview(loadEpisodesButton)
        loadEpisodesButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loadLocationsButton.snp.bottom).offset(20)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    @objc func showCharacters(sender: UIButton!){
        let charactersController = CharactersViewController()
        navigationController?.pushViewController(charactersController, animated: true)
    }
    @objc func showLocations(sender: UIButton!){
        let locationsController = LocationsViewController()
        navigationController?.pushViewController(locationsController, animated: true)
    }
    @objc func showEpisodes(sender: UIButton!){
        let episodesController = EpisodesViewController()
        navigationController?.pushViewController(episodesController, animated: true)
    }
}

