//
//  NetworkLayer.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 24.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Alamofire

protocol NetworkLayerInput {
    func getParams() -> Parameters
}

protocol NetworkLayerInputInput {
    func post(task name: NetworkLayerInput, success: @escaping (Any)->(), error: @escaping (Error)->())
    
    func get()
}

class NetworkLayer: NetworkLayerInputInput {
    func post(task name: NetworkLayerInput, success: @escaping (Any)->(), error: @escaping (Error)->()) {
        request("http://localhost:3000/posts", method: .post, parameters: name.getParams(), encoding: JSONEncoding.default).responseJSON() { response in
            switch response.result {
            case .success(let value):
                success(value)
            case .failure(let errorr):
                error(errorr)
            }
        }
    }
    
    func get() {
        
    }
}
