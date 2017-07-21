//
//  ConfigurationBlockHolder.swift
//  Pods
//
//  Created by George Kiriy on 06/11/2016.
//
//

internal class ConfigurationBlockHolder {
    let block: (ModuleInput) -> Void
    
    init(block: @escaping (ModuleInput) -> Void) {
        self.block = block
    }
}
