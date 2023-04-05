////
////  CharactersViewController.swift
////  Homework_Codable_JSON
////
////  Created by Александр Ковбасин on 04.04.2023.
////
//
import UIKit
import SnapKit

class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var charactersTable: UITableView = {
        
        let Table = UITableView(frame: view.bounds, style: .plain)
        Table.register(TableCell.self, forCellReuseIdentifier: identifier)
        Table.delegate = self
        Table.dataSource = self
        Table.rowHeight = 80
        return Table
    }()
    
    var methodName: String = ""
    
    let identifier = "cellID"
    private var selectedId: Int = -1
    private var characters: [CartoonCharacter] = []
    private let networkLayer: NetworkLayer = UrlSessionNetworkLayer()
    
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(charactersTable)
        charactersTable.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        networkLayer.getCharacters { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let requestError):
                    self.processError(error: requestError)
                case .success(let charactersArray):
                    self.characters = charactersArray
                    self.charactersTable.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell
        cell?.itemNameLabel.text = characters[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterController = CharacterViewController()
        characterController.characterName = characters[indexPath.row].name
        characterController.characterStatus = characters[indexPath.row].status
        characterController.characterGender = characters[indexPath.row].gender
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

