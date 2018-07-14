//
//  ViewController.swift
//  Lekkie
//
//  Created by Elliot on 12/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import UIKit

class OutagesViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!

    private var viewModel: OutagesViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewModel = OutagesViewModel(view: self, networkManager: NetworkManager())
        viewModel?.fetchOutages()
    }
}

extension OutagesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OutagesReuseID", for: indexPath) as! OutageTableViewCell
        let model = viewModel.cellModel(for: indexPath)
        cell.locationLabel.text = model.location
        cell.estRestoreLabel.text = model.estRestoreTime
        cell.typeLabel.text = model.type
        
        return cell
    }
}

extension OutagesViewController: OutagesView {
    func set(state: ViewControllerState) {
        switch state {
        case .loading: print("Loading")
        case .empty: print("Empty")
        case .success:
            print("success")
            OperationQueue.main.addOperation {
              self.tableView.reloadData()
            }
        case let .failure(error): print(error)
        }
    }
}
