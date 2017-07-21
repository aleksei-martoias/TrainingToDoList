//
//  CommonAssemblies.swift
//  DiKit
//
//  Created by George Kiriy on 22/12/2016.
//
//

import Dip
import Dip_UI

open class RootViperAssembly: Assembly {
    public init(withCollaborator collaborator: RootServicesAssembly) {
        super.init(withCollaborator: collaborator)
        DependencyContainer.uiContainers += [container]
    }
}

open class BaseViperAssembly: Assembly {
    public init(withCollaborator collaborator: RootViperAssembly) {
        super.init()
        container.collaborate(with: collaborator.container)
        collaborator.container.collaborate(with: container)
    }
}

open class RootLaunchAssembly: Assembly {
    public init(withCollaborator collaborator: RootServicesAssembly) {
        super.init(withCollaborator: collaborator)
    }
    
    public func injectProperties(to object: Any, ofType type: Any.Type) {
        do {
            _ = try container.resolve(type, builder: { (_ : () throws -> Any) in object })
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    public func injectProperties<T>(to object: T) {
        do {
            _ = try container.resolve(tag: nil) { (_ : () throws -> T) in object }
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}

open class BaseLaunchAssembly: Assembly {
    public init(withCollaborator collaborator: RootLaunchAssembly) {
        super.init()
        container.collaborate(with: collaborator.container)
        collaborator.container.collaborate(with: container)
    }
}

open class RootServicesAssembly: Assembly {
    public init(withCollaborator collaborator: RootCoreAssembly) {
        super.init(withCollaborator: collaborator)
    }
}

open class BaseServiceAssembly: Assembly {
    public init(withCollaborator collaborator: RootServicesAssembly) {
        super.init()
        container.collaborate(with: collaborator.container)
        collaborator.container.collaborate(with: container)
    }
}

open class RootCoreAssembly: Assembly {}

open class BaseCoreAssembly: Assembly {
    public init(withRoot collaborator: RootCoreAssembly) {
        super.init()
        collaborator.container.collaborate(with: container)
    }
}
