//
//  ListPresenterRequestInterface.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import Foundation

protocol ListPresenterRequestInterface: NSObject {
    func succeeded()
}

protocol ListPresenterSearchInterface: NSObject {
    func searchResult()
}
