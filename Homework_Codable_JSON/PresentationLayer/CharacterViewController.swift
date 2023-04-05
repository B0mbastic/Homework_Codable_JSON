//
//  CharacterViewController.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 06.04.2023.
//

import UIKit
import SnapKit

class CharacterViewController: UIViewController {
    var characterName: String = ""
    var characterStatus: String = ""
    var characterGender: String = ""
    private lazy var characterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.text = characterName
        return label
    }()
    private lazy var characterStatusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "Status: \(characterStatus)"
        return label
    }()
    private lazy var characterGenderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "Gender: \(characterGender)"
        return label
    }()
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(characterLabel)
        characterLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
        }
        view.addSubview(characterStatusLabel)
        characterStatusLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(characterLabel.snp.bottom).offset(40)
        }
        view.addSubview(characterGenderLabel)
        characterGenderLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(characterStatusLabel.snp.bottom).offset(40)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    private func processError(error: NetworkError) {
        print(error)
    }
    
}

//extension UIImageView {
//    func loadFrom(URLAddress: String) {
//        guard let url = URL(string: URLAddress) else {
//            return
//        }
//
//        DispatchQueue.main.async { [weak self] in
//            if let imageData = try? Data(contentsOf: url) {
//                if let loadedImage = UIImage(data: imageData) {
//                        self?.image = loadedImage
//                }
//            }
//        }
//    }
//}

