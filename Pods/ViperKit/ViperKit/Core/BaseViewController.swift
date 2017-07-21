//
//  BaseViewController.swift
//  MListing-Viper-iOS
//
//  Created by George Kiriy on 11/08/16.
//  Copyright © 2016 SMediaLink. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController, TransitionHandler {
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let configurationBlock = sender as? ConfigurationBlockHolder else {
            return
        }
        
        let potentialModuleInputProvider: UIViewController
        
        if segue.destination is ModuleInputProvider {
            potentialModuleInputProvider = segue.destination
        } else if let destination = segue.destination as? UINavigationController {
            guard let top = destination.topViewController else {
                fatalError("Pushing empty navigation controller not allowed")
            }
            potentialModuleInputProvider = top
        } else if let destination = segue.destination as? UITabBarController {
            guard let def = destination.selectedViewController else {
                fatalError("Pushing empty tab bar controller not allowed")
            }
            potentialModuleInputProvider = def
        } else {
            fatalError("Module input provider not found")
        }
        
        
        guard let controller = potentialModuleInputProvider as? ModuleInputProvider else {
            fatalError("Controller should be Module Input provider")
        }
        
        configurationBlock.block(controller.moduleInput)
    }
    
    open func openModule(segueIdentifier: String) {
        performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
    
    open func openModule(segueIdentifier: String, configurationBlock: @escaping ConfigurationBlock) {
        performSegue(withIdentifier: segueIdentifier, sender: ConfigurationBlockHolder(block: configurationBlock))
    }
    
    open func closeCurrentModule() {
        if let parentViewController = self.parent {
            if let navigationVc = parentViewController as? UINavigationController {
                if navigationVc.viewControllers.count > 1 {
                    navigationVc.popViewController(animated: true)
                } else {
                    navigationVc.dismiss(animated: true, completion: nil)
                }
                return
            }
        }
        
        guard let _ = presentingViewController else {
            fatalError("Cannot dismiss this vc")
        }
        return self.dismiss(animated: true, completion: nil)
    }
}
