//
//  DateTaskCreationScreenDateTaskCreationScreenConfigurator.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

class DateTaskCreationScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? DateTaskCreationScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: DateTaskCreationScreenViewController) {

        let router = DateTaskCreationScreenRouter()

        let presenter = DateTaskCreationScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = DateTaskCreationScreenInteractor()
        interactor.output = presenter
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            interactor.dataSource = try? appDelegate.container.resolve() as DataSource
        }

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}
