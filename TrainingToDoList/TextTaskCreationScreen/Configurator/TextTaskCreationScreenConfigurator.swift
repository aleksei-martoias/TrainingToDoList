//
//  TextTaskCreationScreenTextTaskCreationScreenConfigurator.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

class TextTaskCreationScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TextTaskCreationScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TextTaskCreationScreenViewController) {

        let router = TextTaskCreationScreenRouter()

        let presenter = TextTaskCreationScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TextTaskCreationScreenInteractor()
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
