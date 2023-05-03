
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
        button.tag = 1
        button.setTitle("Load characters", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showSection), for: .touchUpInside)
        return button
    }()
    
    private lazy var loadLocationsButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.layer.zPosition = 5
        button.tag = 2
        button.setTitle("Load locations", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showSection), for: .touchUpInside)
        return button
    }()
    
    private lazy var loadEpisodesButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 15
        button.layer.zPosition = 5
        button.tag = 3
        button.setTitle("Load episodes", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showSection), for: .touchUpInside)
        return button
    }()
    
    private lazy var resetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 15
        button.layer.zPosition = 5
        button.tag = 0
        button.setTitle("Reset App", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(showSection), for: .touchUpInside)
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
        
        view.addSubview(resetButton)
        resetButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(loadEpisodesButton.snp.bottom).offset(60)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        Configurator.shared.configure(controller: self)
        checkStoredSection()
    }
    
    func checkStoredSection() {
        interactor?.checkStoredSection()
    }
    
    func setCurrentSection(sectionId: Int) {
        switch sectionId {
        case 1:
            startUpCoordinator?.navigateToCharacters()
        case 2:
            startUpCoordinator?.navigateToLocations()
        case 3:
            startUpCoordinator?.navigateToEpisodes()
        case 0:
            print ("Main menu")
        default:
            print ("")
        }
    }
    
    @objc func showSection(sender: UIButton!){
        let buttonTag: Int = sender.tag
        interactor?.setStoredSection(sectionId: buttonTag)
    }
}

