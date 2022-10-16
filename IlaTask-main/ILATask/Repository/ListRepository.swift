//
//  ListRepository.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import Foundation


struct List {
    var animals: [String]
    var furits: [String]
    var vegatables: [String]

}

class ListRepository: ListRepositoryInterface {

    var list: List

    init() {
        list = List(animals: ["lion","butterfly","chetta","dog","eagle","elephant","horse","owl","snake","tiger"], furits: ["apple","bananas","grapes","kiwi","mango","orange","pineapple","strawberry","watermelon"], vegatables: ["broccoli","cabbage","carrot","corn","eggplant","onion","pea","potato","pumpkin","tomato"])
    }

    func requestImageList(completionHandler: @escaping (List) -> ()) {
        completionHandler(list)
    }
}
