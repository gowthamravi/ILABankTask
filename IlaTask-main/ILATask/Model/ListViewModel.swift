//
//  ListViewModel.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import Foundation

struct ListViewModel {
    let name: String
    let imageUrl: String
    let subListModel: [SubListModel]
}

struct SubListModel {
    let name: String
    let imageUrl: String
}

