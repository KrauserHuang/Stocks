//
//  SearchResultTableViewCell.swift
//  Stocks
//
//  Created by Tai Chin Huang on 2023/5/27.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
