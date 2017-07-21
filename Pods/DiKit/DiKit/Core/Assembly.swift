//
//  Core.swift
//  DiKit
//
//  Created by George Kiriy on 22/12/2016.
//
//

import Foundation
import Dip

open class Assembly {
    public let container = DependencyContainer()
    
    public init() {
        
    }
    
    public init(withCollaborator collaborator: Assembly) {
        container.collaborate(with: collaborator.container)
    }
    
    public func resolve<T>(tag: String? = nil) -> T {
        do {
            return try container.resolve(tag: tag)
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func bootstrap() {
        do {
            try container.bootstrap()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
