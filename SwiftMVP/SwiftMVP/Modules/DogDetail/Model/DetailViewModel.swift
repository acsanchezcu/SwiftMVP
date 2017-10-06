//
//  DetailViewModel.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation

struct DetailViewModel {
    
    // MARK: - Properties

    var imageUrl: String
    
    // MARK: - Mapper
    
    static func viewModel(forResponse response: DetailResponseModel) -> [DetailViewModel] {
        return response.images.map { DetailViewModel(imageUrl: $0) }
    }
}
