//
//  DetailResponseModel.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation

struct DetailResponseModel {
    let status: String
    let images: [String]
}

extension DetailResponseModel: Decodable {
    
    private enum Keys: String, CodingKey {
        case status = "status"
        case images = "message"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let status = try container.decode(String.self, forKey: .status)
        let images = try container.decode([String].self, forKey: .images)
        
        self.init(status: status, images: images)
    }
}
