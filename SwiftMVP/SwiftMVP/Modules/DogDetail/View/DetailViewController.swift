//
//  DetailViewController.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
            collectionView.delegate = self
        }
    }
    
    // MARK: - Properties
    
    var dogViewModel: DogsViewModel?
    
    lazy var presenter: DetailPresenterProtocol = {
        let service = DetailService()
        let presenter = DetailPresenter(service: service)
        presenter.view = self
        return presenter
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let viewModel = dogViewModel else { return }
        
        presenter.viewIsReady(viewModel)
    }

}

extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfImages()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailCollectionViewCell", for: indexPath)
        
        if let detailCell = cell as? DetailCollectionViewCell {
            presenter.configure(cell: detailCell, forIndexPath: indexPath)
        }
        
        return cell
    }
    
}

extension DetailViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.width/3)
    }
    
}

extension DetailViewController: DetailView {
    
    func refreshData() {
        collectionView.reloadData()
    }
    
    func display(title: String) {
        self.title = title
    }
    
}
