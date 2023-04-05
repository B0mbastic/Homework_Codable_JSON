//
//  CharacterCell.swift
//  Homework_Codable_JSON
//
//  Created by Александр Ковбасин on 04.04.2023.
//

import Foundation
import UIKit

class TableCell: UITableViewCell {
    lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    //   var characterImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //        addSubview(characterImage)
        //
        //        characterImage.frame = CGRect(x: 10, y: 10, width: 60, height: 60)
        //        characterImage.layer.borderWidth = 1
        //        characterImage.contentMode = .scaleAspectFill
        //        characterImage.clipsToBounds = true
        
        addSubview(itemNameLabel)
        itemNameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(40)
            make.centerY.equalTo(self)
            
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
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
