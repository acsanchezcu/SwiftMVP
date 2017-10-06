//
//  BaseProtocols.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import Foundation

protocol ViewProtocol: class {
    func showLoading()
    func dismissLoading()
    func displayAlert(withTitle title: String, message: String)
}
