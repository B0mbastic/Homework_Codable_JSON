//
//  EpisodeViewController.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 05.04.2023.
//

import UIKit
import SnapKit

class EpisodeViewController: UIViewController {
    var episodeName: String = ""
    var episodeCode: String = ""
    var episodeAirDate: String = ""
    private lazy var episodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.text = episodeName
        return label
    }()
    private lazy var episodeCodeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "Code: \(episodeCode)"
        return label
    }()
    private lazy var episodeAirDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "Air date: \(episodeAirDate)"
        return label
    }()
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(episodeLabel)
        episodeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
        }
        view.addSubview(episodeCodeLabel)
        episodeCodeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(episodeLabel.snp.bottom).offset(40)
        }
        view.addSubview(episodeAirDateLabel)
        episodeAirDateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(episodeCodeLabel.snp.bottom).offset(40)
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
