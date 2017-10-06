//
//  DogsViewController.swift
//  SwiftMVP
//
//  Created by Sanchez Custodio, Abel (Cognizant) on 06/10/2017.
//  Copyright © 2017 Sanchez Custodio, Abel. All rights reserved.
//

import UIKit

class DogsViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.estimatedRowHeight = 90.0
        }
    }
    
    // MARK: - Properties
    
    var loadingView: LoadingView?
    
    lazy var presenter: DogsPresenter = {
        let service = DogsService()
        var presenter = DogsPresenter(service: service)
        presenter.view = self
        return presenter
    }()
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewIsReady()
    }

}

extension DogsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfDogs()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DogsTableViewCell", for: indexPath)
    
        if let dogsCell = cell as? DogsTableViewCell {
            presenter.configure(cell: dogsCell, forIndexPath: indexPath)
        }
        
        return cell
    }
    
}

extension DogsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.select(indexPath: indexPath)
    }
    
}

extension DogsViewController: DogsView {
    
    func refreshData() {
        tableView.reloadData()
    }
    
    func reloadIndexPaths(_ indexPaths: [IndexPath]) {
        tableView.reloadRows(at: indexPaths, with: .automatic)
    }
    
    func indexPathsVisible() -> [IndexPath]? {
        return tableView.indexPathsForVisibleRows
    }

    func showLoading() {
        guard let view = navigationController?.view else { return }
        
        loadingView = LoadingView()
        
        view.addSubview(loadingView!)
        
        loadingView?.translatesAutoresizingMaskIntoConstraints = false
        loadingView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadingView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loadingView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
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
