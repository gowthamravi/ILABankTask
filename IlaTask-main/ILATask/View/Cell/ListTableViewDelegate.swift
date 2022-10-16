//
//  ListTableViewDelegate.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import Foundation
import UIKit

protocol ListTableViewDelegateInterface: UITableViewDelegate, UITableViewDataSource {
    var subList: [SubListModel] { get set }
    var list: [ListViewModel] { get set }
}

protocol ListDelegate: AnyObject {
    func reload()
    func selectedIndex(index: Int)
    func searchText(text: String)
}

class ListTableViewDelegate: NSObject, ListTableViewDelegateInterface {

    var subList: [SubListModel] = []
    var list: [ListViewModel] = []
    private weak var delegate: ListDelegate?

    init(delegate: ListDelegate? = nil) {
        self.delegate = delegate
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return subList.count
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.identifier) as? CollectionTableViewCell else {
                return UITableViewCell()
            }
            cell.configureList(list: list)
            cell.selectedSection = { index in
                self.delegate?.selectedIndex(index: index)
            }
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier) as? ListTableViewCell else {
                return UITableViewCell()
            }
            let listValues = subList[indexPath.row]
            cell.configureList(list: listValues)
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }


    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0, indexPath.section == 0 {
            return 200
        } else {
            return 100
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: TableViewHeaderCell.identifier) as! TableViewHeaderCell
        headerView.searchText = { text in
            self.delegate?.searchText(text: text)
        }
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 { return 0 }
        return 50
    }
}

