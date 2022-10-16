//
//  TableViewHeaderCell.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 14/10/22.
//

import Foundation
import UIKit

class TableViewHeaderCell: UITableViewHeaderFooterView, UISearchBarDelegate {

    static let identifier = "TableViewCellHeader"
    fileprivate lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barStyle = .default
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        return searchBar
    }()

    var searchText:((_ text: String)-> Void)?
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
 
    func setup() {
        contentView.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            searchBar.topAnchor.constraint(equalTo: contentView.topAnchor),
            searchBar.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        if let text = self.searchText {
            text(textSearched)
        }
    }
}
