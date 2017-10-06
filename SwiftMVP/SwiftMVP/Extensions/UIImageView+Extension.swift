//
//  UIImageView+Extension.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func loadImageUrl(_ urlString: String) {
        if let image = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = image
            return
        }
        
        image = #imageLiteral(resourceName: "dog")
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data,
                let image = UIImage(data: data) {
                
                imageCache.setObject(image, forKey: urlString as AnyObject)
                
                DispatchQueue.main.async {
                    self.image = image
                }
                
            }
        }.resume()
    }
    
}
