//
//  CoreAssembly.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 19.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Foundation
import Dip
import Dip_UI

class CoreAssembly {
    class func registerEntities() -> DependencyContainer {
        let container = DependencyContainer()
        
        container.register(.singleton) { RepositoryServiceImplementation() }
        .implements(RepositoryService.self)
        
        container.register(.singleton) { DataSourceImplementation(repositoryService: $0) }
        .implements(DataSource.self)
        
        return container
    }
}
