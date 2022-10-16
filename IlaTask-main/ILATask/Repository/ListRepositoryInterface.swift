//
//  ListRepositoryInterface.swift
//  ILATask
//
//  Created by Ravikumar, Gowtham on 13/10/22.
//

import Foundation

protocol ListRepositoryInterface {
    func requestImageList(completionHandler: @escaping (List) -> ())
}
