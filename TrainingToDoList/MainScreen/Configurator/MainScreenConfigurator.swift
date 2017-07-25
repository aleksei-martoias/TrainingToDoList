//
//  MainScreenMainScreenConfigurator.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

class MainScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? MainScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: MainScreenViewController) {

        let router = MainScreenRouter()
        router.transitionHandler = viewController
        
        let presenter = MainScreenPresenter()
        presenter.view = viewController
        presenter.router = router
        
        let tableManager = TableViewManager()
        presenter.tableManager = tableManager
        tableManager.output = presenter

        let interactor = MainScreenInteractor()
        interactor.output = presenter
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            interactor.dataSource = try? appDelegate.container.resolve() as DataSource
            interactor.networkLayer = try? appDelegate.container.resolve() as NetworkLayerInputInput
        }

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}
