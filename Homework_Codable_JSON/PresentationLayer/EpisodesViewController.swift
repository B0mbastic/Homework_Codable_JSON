//
//  EpisodesViewController.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 05.04.2023.
//

import UIKit
import SnapKit

class EpisodesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private lazy var episodesTable: UITableView = {
        let Table = UITableView(frame: view.bounds, style: .plain)
        Table.register(TableCell.self, forCellReuseIdentifier: identifier)
        Table.delegate = self
        Table.dataSource = self
        Table.rowHeight = 80
        return Table
    }()
    
    let identifier = "cellID"
    private var selectedId: Int = -1
    private var episodes: [CartoonEpisode] = []
    private let networkLayer: NetworkLayer = UrlSessionNetworkLayer()
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubview(episodesTable)
        episodesTable.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        networkLayer.getEpisodes { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let requestError):
                    self.processError(error: requestError)
                case .success(let charactersArray):
                    self.episodes = charactersArray
                    self.episodesTable.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? TableCell
        cell?.itemNameLabel.text = episodes[indexPath.row].name
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let episodeController = EpisodeViewController()
        episodeController.episodeName = episodes[indexPath.row].name
        episodeController.episodeCode = episodes[indexPath.row].episode
        episodeController.episodeAirDate = episodes[indexPath.row].airdate
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


