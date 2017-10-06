//
//  DogsProtocols.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation

protocol DogsView: class {
	func refreshData()
    func showLoading()
    func dismissLoading()
    func displayAlert(withTitle title: String, message: String)
    func reloadIndexPaths(_ indexPaths: [IndexPath])
    func indexPathsVisible() -> [IndexPath]?
}

protocol DogsCellProtocol {
    func display(viewModel: DogsViewModel)
}

protocol DogsPresenterProtocol {
    func viewIsReady()
    func numberOfDogs() -> Int
    func select(indexPath: IndexPath)
    func configure(cell: DogsTableViewCell, forIndexPath indexPath: IndexPath)
}

typealias GetDogsCompletionHandler = (DogsListResponse?, Error?) -> Void
typealias GetRandomImageCompletionHandler = (DogsRandomImageResponse?, Error?) -> Void

protocol DogsServiceProtocol {
    func getDogs(completionHandler: @escaping GetDogsCompletionHandler)
    func getRandomImage(breed: String, completionHandler: @escaping GetRandomImageCompletionHandler)
}
