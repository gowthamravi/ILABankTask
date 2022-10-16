//
//  ListPresenter.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import Foundation

class ListPresenter: ListPresenterInterface {

    var listModel: [ListViewModel] = []
    var filteredList: [SubListModel] = []
    var repository: ListRepositoryInterface
    weak var delegate: ListPresenterRequestInterface?
    weak var searchDelegate: ListPresenterSearchInterface?

    var data: List? {
        didSet {

            let vegatables =  ListViewModel(name: "Vegatable", imageUrl: "vegatable", subListModel: data?.vegatables.map({ name in
                SubListModel(name: name, imageUrl: name)
            }) ?? [])

            let furits =  ListViewModel(name: "Furits", imageUrl: "furit", subListModel: data?.furits.map({ name in
                 SubListModel(name: name, imageUrl: name)
             }) ?? [])

            let animals =  ListViewModel(name: "Animals", imageUrl: "animals", subListModel: data?.animals.map({ name in
                 SubListModel(name: name, imageUrl: name)
             }) ?? [])

            listModel.append(vegatables)
            listModel.append(furits)
            listModel.append(animals)
            delegate?.succeeded()
        }
    }

    required init(repository: ListRepositoryInterface) {
        self.repository = repository
    }

    func getList() {
        repository.requestImageList { list in
            self.data = list
        }
    }
    
    func getSearchResult(selectedIndex: Int, textSearched: String) {
        if textSearched != "" {
            filteredList = listModel[selectedIndex].subListModel.filter {
                $0.name.localizedCaseInsensitiveContains(textSearched)
            }
            searchDelegate?.searchResult()
        }else {
            filteredList.removeAll()
            delegate?.succeeded()
        }
    }
}
