//
//  DetailPresenter.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

class DetailPresenter {
    
    // MARK: - Properties
    var viewModels: [DetailViewModel] = []
    weak var view: DetailView?
    let service: DetailService
    
    // MARK: - Init
    
    init(service: DetailService) {
        self.service = service
    }
    
    // MARK: - Private Methods
    
    private func getBreedName(_ dogViewModel: DogsViewModel, characterToAppend: String) -> String {
        var breed = dogViewModel.breed
        
        if let subBreed = dogViewModel.subBreed { breed.append("\(characterToAppend)\(subBreed)") }
        
        return breed
    }
    
    //WS
    
    private func getBreedImages(_ dogViewModel: DogsViewModel) {
        view?.showLoading()
        service.getBreedImages(breed: getBreedName(dogViewModel, characterToAppend: "/")) { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.view?.dismissLoading()
                if let error = error {
                    self?.view?.displayAlert(withTitle: "Error", message: error.localizedDescription)
                } else if let response = response {
                    self?.viewModels = DetailViewModel.viewModel(forResponse: response)
                    self?.view?.refreshData()
                }
            }
        }
    }
}

extension DetailPresenter: DetailPresenterProtocol {
    
    func viewIsReady(_ dogViewModel: DogsViewModel) {
        view?.display(title: getBreedName(dogViewModel, characterToAppend: " "))
        getBreedImages(dogViewModel)
    }
    
    func select(indexPath: IndexPath) {
        
    }
    
    func numberOfImages() -> Int {
        return viewModels.count
    }
    
    func configure(cell: DetailCollectionViewCell, forIndexPath indexPath: IndexPath) {
        cell.display(viewModel: viewModels[indexPath.row])
    }
}
