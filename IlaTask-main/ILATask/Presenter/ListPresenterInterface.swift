//
//  ListPresenterInterface.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import Foundation

protocol ListPresenterInterface {
    init(repository: ListRepositoryInterface)
    var listModel: [ListViewModel] { get set }
    var filteredList: [SubListModel] { get set }
    var delegate: ListPresenterRequestInterface? { get set }
    var searchDelegate: ListPresenterSearchInterface? { get set }
    func getList()
    func getSearchResult(selectedIndex: Int, textSearched: String)
}
