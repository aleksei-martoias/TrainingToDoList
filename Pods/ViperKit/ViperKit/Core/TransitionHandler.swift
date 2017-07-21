//
//  TransitionHandler.swift
//  MListing-Viper-iOS
//
//  Created by George Kiriy on 11/08/16.
//  Copyright © 2016 SMediaLink. All rights reserved.
//

public typealias ConfigurationBlock = (ModuleInput) -> Void

public protocol TransitionHandler: class {
    func openModule(segueIdentifier: String)
    func openModule(segueIdentifier: String, configurationBlock: @escaping ConfigurationBlock)
    func closeCurrentModule()
}
