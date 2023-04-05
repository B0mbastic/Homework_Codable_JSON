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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
