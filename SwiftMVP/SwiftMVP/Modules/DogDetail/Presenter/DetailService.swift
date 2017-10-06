//
//  DetailService.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation

class DetailService: DetailServiceProtocol {
    
    func getBreedImages(breed: String, completionHandler: @escaping GetBreedImagesCompletionHandler) {
        let session = URLSession(configuration: .default)
        
        let urlRequest = URLRequest(url: URL(string: "https://dog.ceo/api/breed/\(breed)/images")!)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            } else if let data = data {
                let response = try? JSONDecoder().decode(DetailResponseModel.self, from: data)
                
                completionHandler(response, nil)
            } else {
                completionHandler(nil, nil)
            }
            }.resume()
    }
    
}
