//
//  DiscoveryTabViewModel.swift
//  Ceair
//
//  Created by Matt Tian on 02/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import Foundation

protocol DiscoveryTabViewModelCoordinatorDelegate {
    func didSelectDestination()
}

class DiscoveryTabViewModel {
    
    var coordinator: DiscoveryTabViewModelCoordinatorDelegate?
    
    let dataModel: DiscoveryTabDataModelProtocol
    
    init(dataModel: DiscoveryTabDataModelProtocol) {
        self.dataModel = dataModel
    }
    
    func didSelectDestination() {
        coordinator?.didSelectDestination()
    }
    
}
