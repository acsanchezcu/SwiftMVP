//
//  DetailCollectionViewCell.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var breedImageView: UIImageView!
    
}

extension DetailCollectionViewCell: DetailCollectionViewCellProtocol {
    
    func display(viewModel: DetailViewModel) {        
        breedImageView.loadImageUrl(viewModel.imageUrl)
    }
    
}
