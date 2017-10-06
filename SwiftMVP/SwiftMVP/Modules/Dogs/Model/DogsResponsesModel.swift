//
//  Dogs.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation

struct DogsListResponse {
    let status: String
    let dogs: [String: [String]]
}

extension DogsListResponse: Decodable {
    
    private enum Keys: String, CodingKey {
        case status = "status"
        case dogs = "message"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let status = try container.decode(String.self, forKey: .status)
        let dogs = try container.decode([String: [String]].self, forKey: .dogs)
        
        self.init(status: status, dogs: dogs)
    }
    
}

struct DogsRandomImageResponse {
    let status: String
    let imageUrl: String
}

extension DogsRandomImageResponse: Decodable {
    
    private enum Keys: String, CodingKey {
        case status = "status"
        case imageUrl = "message"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        let status = try container.decode(String.self, forKey: .status)
        let imageUrl = try container.decode(String.self, forKey: .imageUrl)
        
        self.init(status: status, imageUrl: imageUrl)
    }
    
}

