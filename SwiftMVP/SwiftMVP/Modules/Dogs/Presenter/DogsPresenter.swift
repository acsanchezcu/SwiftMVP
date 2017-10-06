//
//  DogsPresenter.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation
import UIKit

class DogsPresenter {
    
    // MARK: - Properties
    
    var viewModels: [DogsViewModel] = []
    weak var view: DogsView?
    let service: DogsService
    
    // MARK: - Init
    
    init(service: DogsService) {
        self.service = service
    }
    
    // MARK: - Private Methods
    
    private func reloadIndexPathIfNeeded(index: Int) {
        DispatchQueue.main.async { [weak self] in
            guard let indexPaths = self?.view?.indexPathsVisible() else { return }
            
            let indexPath = IndexPath(row: index, section: 0)
            
            if indexPaths.contains(indexPath) {
                self?.view?.reloadIndexPaths([indexPath])
            }
        }
    }
    
    // WS
    
    private func getDogs() {
        service.getDogs { [weak self] (response, error) in
            DispatchQueue.main.async {
                self?.view?.dismissLoading()
                if let error = error {
                    self?.view?.displayAlert(withTitle: "Error", message: error.localizedDescription)
                } else if let response = response {
                    self?.viewModels = DogsViewModel.viewModel(forResponse: response)
                    self?.view?.refreshData()
                    self?.getRandomImages()
                }
            }
        }
    }
    
    private func getRandomImages() {
        for (index,viewModel) in viewModels.enumerated() {
            var breed = viewModel.breed
            if let subBreed = viewModel.subBreed { breed.append("/\(subBreed)") }
            service.getRandomImage(breed: breed, completionHandler: { [weak self] (response, error) in
                if let response = response {
                    if response.imageUrl != "Breed not found" {
                        self?.viewModels[index].imageUrl = response.imageUrl
                        self?.reloadIndexPathIfNeeded(index: index)
                    }
                }
            })
        }
    }
}

extension DogsPresenter: DogsPresenterProtocol {
    
    func viewIsReady() {
        view?.showLoading()
        getDogs()
    }
    
    func numberOfDogs() -> Int {
        return viewModels.count
    }
    
    func configure(cell: DogsTableViewCell, forIndexPath indexPath: IndexPath) {
        cell.display(viewModel: viewModels[indexPath.row])
    }
    
    func select(indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Detail", bundle: nil)
        
        if let viewController = storyboard.instantiateInitialViewController() as? DetailViewController {
            viewController.dogViewModel = viewModels[indexPath.row]
            view?.push(viewController: viewController, animated: true)
        }
    }
}
