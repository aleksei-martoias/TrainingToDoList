//
//  ImageTaskCreationScreenImageTaskCreationScreenConfigurator.swift
//  TrainingToDoList
//
//  Created by Aleksei on 20/07/2017.
//  Copyright © 2017 S Media Link. All rights reserved.
//

import UIKit

class ImageTaskCreationScreenModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? ImageTaskCreationScreenViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: ImageTaskCreationScreenViewController) {

        let router = ImageTaskCreationScreenRouter()

        let presenter = ImageTaskCreationScreenPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = ImageTaskCreationScreenInteractor()
        interactor.output = presenter
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            interactor.picker = try? appDelegate.container.resolve() as PickerInput
            interactor.picker?.set(output: interactor)
            interactor.dataSource = try? appDelegate.container.resolve() as DataSource
        }

        presenter.interactor = interactor
        viewController.output = presenter
        viewController.moduleInput = presenter
    }

}
