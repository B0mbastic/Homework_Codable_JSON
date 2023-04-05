//
//  LocationViewController.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 06.04.2023.
//

import UIKit
import SnapKit

class LocationViewController: UIViewController {
    var locationName: String = ""
    var locationType: String = ""
    var locationDimension: String = ""
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 30.0)
        label.text = locationName
        return label
    }()
    private lazy var locationTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "Type: \(locationType)"
        return label
    }()
    private lazy var locationDimensionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20.0)
        label.text = "Dimension: \(locationDimension)"
        return label
    }()
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(locationLabel)
        locationLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
        }
        view.addSubview(locationTypeLabel)
        locationTypeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(locationLabel.snp.bottom).offset(40)
        }
        view.addSubview(locationDimensionLabel)
        locationDimensionLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.trailing.equalToSuperview().inset(40)
            make.top.equalTo(locationTypeLabel.snp.bottom).offset(40)
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


