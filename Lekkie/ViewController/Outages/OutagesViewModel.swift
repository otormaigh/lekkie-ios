//
//  OutagesViewModel.swift
//  Lekkie
//
//  Created by Elliot on 14/07/2018.
//  Copyright © 2018 Penny Labs. All rights reserved.
//

import Foundation

enum ViewControllerState {
    case loading
    case empty
    case success
    case failure(String)
}

protocol OutagesView: class {
    func set(state: ViewControllerState)
}

class OutagesViewModel {
    private weak var view: OutagesView?
    private let networkManager: NetworkManager
    var dataSource = [(key: String, value: Outage)]()
    
    init(view: OutagesView, networkManager: NetworkManager) {
        self.view = view
        self.networkManager = networkManager
    }
    
    func cellModel(for indexPath: IndexPath) -> OutagesTableViewModel {
        let outage = dataSource[indexPath.row].value
        return OutagesTableViewModel(outage: outage)
    }
    
    func fetchOutages() {
        networkManager.getOutages() {
            outages, error in
            if let error = error {
                print(error)
            }
            if let outages = outages {
                outages.forEach { outage in self.fetchOutageDetail(id: outage.id)}
            }
        }
    }
    
    private func fetchOutageDetail(id: String) {
        networkManager.getOutage(id: id) {
            outage, error in
            if let error = error {
                print(error)
            }
            if let outage = outage {
                self.dataSource.append((key: outage.id, value: outage))
                self.view?.set(state: ViewControllerState.success)
            }
        }
    }
}
