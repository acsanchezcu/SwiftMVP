//
//  DogsService.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation

class DogsService: DogsServiceProtocol {
    
    func getDogs(completionHandler: @escaping GetDogsCompletionHandler) {
        let session = URLSession(configuration: .default)
        
        let urlRequest = URLRequest(url: URL(string: "https://dog.ceo/api/breeds/list/all")!)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            } else if let data = data {
                let response = try? JSONDecoder().decode(DogsListResponse.self, from: data)
        
                completionHandler(response, nil)
            } else {
                completionHandler(nil, nil)
            }
        }.resume()
    }
    
    func getRandomImage(breed: String, completionHandler: @escaping GetRandomImageCompletionHandler) {
        let session = URLSession(configuration: .default)
        
        let urlRequest = URLRequest(url: URL(string: "https://dog.ceo/api/breed/\(breed)/images/random")!)
        
        session.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            } else if let data = data {
                let response = try? JSONDecoder().decode(DogsRandomImageResponse.self, from: data)
                
                completionHandler(response, nil)
            } else {
                completionHandler(nil, nil)
            }
            }.resume()
    }
}
