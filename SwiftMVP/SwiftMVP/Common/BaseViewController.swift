//
//  BaseViewController.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    var loadingView: LoadingView?
}

extension BaseViewController: ViewProtocol {
    
    func showLoading() {
        let mainView: UIView!
        
        if let view = navigationController?.view {
            mainView = view
        } else {
            mainView = view
        }
        
        loadingView = LoadingView()
        
        mainView.addSubview(loadingView!)
        
        loadingView?.translatesAutoresizingMaskIntoConstraints = false
        loadingView?.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        loadingView?.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        loadingView?.leadingAnchor.constraint(equalTo: mainView.leadingAnchor).isActive = true
        loadingView?.trailingAnchor.constraint(equalTo: mainView.trailingAnchor).isActive = true
    }
    
    func dismissLoading() {
        loadingView?.removeFromSuperview()
        loadingView = nil
    }
    
    func displayAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
}
