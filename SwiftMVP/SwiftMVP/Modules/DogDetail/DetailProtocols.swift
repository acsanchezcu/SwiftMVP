//
//  DetailProtocols.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation

protocol DetailView: ViewProtocol {
    func refreshData()
    func display(title: String)
}

protocol DetailPresenterProtocol {
    func viewIsReady(_ dogViewModel: DogsViewModel) 
    func select(indexPath: IndexPath)
    func numberOfImages() -> Int
    func configure(cell: DetailCollectionViewCell, forIndexPath indexPath: IndexPath)
}

typealias GetBreedImagesCompletionHandler = (DetailResponseModel?, Error?) -> ()

protocol DetailServiceProtocol {
    func getBreedImages(breed: String, completionHandler: @escaping GetBreedImagesCompletionHandler)
}

protocol DetailCollectionViewCellProtocol {
    func display(viewModel: DetailViewModel)
}
