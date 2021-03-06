//
//  DestinationFilterCoordinator.swift
//  Ceair
//
//  Created by Matt Tian on 03/01/2018.
//  Copyright © 2018 Bizersoft. All rights reserved.
//

import UIKit

class DestinationFilterCoordinator: AppCoordinator {

    var destinationFilterView: DestinationFilterView?

    deinit {
        print("Deinit Destination Filter Coordinator")
    }
    
    override func start() {
        let dataModel = DestinationFilterDataModel()
        let viewModel = DestinationFilterViewModel(dataModel: dataModel)
        viewModel.coordinator = self
        
        destinationFilterView = DestinationFilterView()
        destinationFilterView?.viewModel = viewModel
        destinationFilterView?.show(window)
    }
    
    func showFilter(with tag: Int) {
        start()
        destinationFilterView?.handleFilter(with: tag)
    }
    
}

extension DestinationFilterCoordinator: DestinationFilterViewModelCoordinatorDelegate {
    
    func dismiss() {
        destinationFilterView = nil
        coordinatorStack.pop()
        if let destinationCoordinator = coordinatorStack.peek() as? DestinationCoordinator {
            destinationCoordinator.dismissFilter()
        }
    }
    
}
