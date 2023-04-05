//
//  LocationsViewController.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 05.04.2023.
//

import UIKit
import SnapKit

class LocationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private lazy var locationsTable: UITableView = {
        
        let Table = UITableView(frame: view.bounds, style: .plain)
        Table.register(TableCell.self, forCellReuseIdentifier: identifier)
        Table.delegate = self
        Table.dataSource = self
        Table.rowHeight = 80
        return Table
    }()
    
    let identifier = "cellID"
    private var selectedId: Int = -1
    private var locations: [CartoonLocation] = []
    private let networkLayer: NetworkLayer = UrlSessionNetworkLayer()
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(locationsTable)
        locationsTable.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        networkLayer.getLocations { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let requestError):
                    self.processError(error: requestError)
                case .success(let charactersArray):
                    self.locations = charactersArray
                    self.locationsTable.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell
        cell?.itemNameLabel.text = locations[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection
                   section: Int) -> String? {
        return "Locations of Rick nad Morty:"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let locationController = LocationViewController()
        locationController.locationName = locations[indexPath.row].name
        locationController.locationType = locations[indexPath.row].type
        locationController.locationDimension = locations[indexPath.row].dimension
        navigationController?.pushViewController(locationController, animated: true)
    }
    
    private func processError(error: NetworkError) {
        print(error)
    }
    
}


