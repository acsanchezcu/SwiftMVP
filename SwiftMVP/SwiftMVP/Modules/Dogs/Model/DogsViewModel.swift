//
//  DogsViewModel.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

struct DogsViewModel {
    
    // MARK: - Properties
    
    let breed: String
    let subBreed: String?
    var imageUrl: String?
    
    // MARK: - Mapper
    
    static func viewModel(forResponse response: DogsListResponse) -> [DogsViewModel] {
        var viewModels: [DogsViewModel] = []
        
        for dog in response.dogs {
            if dog.value.isEmpty {
                viewModels.append(DogsViewModel(breed: dog.key, subBreed: nil, imageUrl: nil))
            } else {
                dog.value.forEach { viewModels.append(DogsViewModel(breed: dog.key, subBreed: $0, imageUrl: nil)) }
            }
        }
        
        return viewModels
    }
}


