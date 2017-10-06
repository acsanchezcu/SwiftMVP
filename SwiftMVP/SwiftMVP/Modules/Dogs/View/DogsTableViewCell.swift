//
//  DogsTableViewCell.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

class DogsTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var subBreedLabel: UILabel!
    @IBOutlet weak var breedImageView: UIImageView! {
        didSet {
            breedImageView.layer.masksToBounds = true
            breedImageView.layer.cornerRadius = 25
        }
    }

}

extension DogsTableViewCell: DogsCellProtocol {
    
    func display(viewModel: DogsViewModel) {
        breedLabel?.text = viewModel.breed
        subBreedLabel?.text = viewModel.subBreed
        
        if let imageUrl = viewModel.imageUrl {
            breedImageView?.loadImageUrl(imageUrl)
        } else {
            breedImageView?.image = #imageLiteral(resourceName: "dog")
        }
    }
    
}
