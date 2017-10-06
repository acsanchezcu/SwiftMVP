//
//  LoadingView.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

class LoadingView: UIView {
    
    // MARK: - UI properties
    
    let blackBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return view
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.tintColor = .black
        return activityIndicator
    }()
    
    // MARK: - Init
    
    init() {
        super.init(frame: CGRect.zero)
        
        setupUILayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    
    func setupUILayout() {
        addSubview(blackBackgroundView)
        
        blackBackgroundView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blackBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blackBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blackBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}

