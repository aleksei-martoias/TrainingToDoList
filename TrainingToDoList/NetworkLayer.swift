//
//  NetworkLayer.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 24.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import Alamofire
import ObjectMapper

protocol NetworkLayerInput {
    func getParams() -> Parameters
}

protocol NetworkLayerInputInput {
    func post(task name: NetworkLayerInput, success: @escaping (Any)->(), error: @escaping (Error)->())
    
    func get(synch: @escaping ([Any]) -> ())
    
    func delete(id: Int)
    
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
    
    func get(synch: @escaping ([Any]) -> ()) {
        Alamofire.request("http://localhost:3000/posts").responseJSON { response in
            switch response.result {
            case .success(let value):
                if let dict = value as? [[String : Any]] {
                    synch(self.parse(dict: dict))
                }
            case .failure(let error):
                break
            }
        }
    }
    
    func delete(id: Int) {
        request("http://localhost:3000/posts/" + "/(id)", method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: nil)
    }
    
    func parse(dict: [[String : Any]]) -> [Any] {
        var res = [Any]()
        for item in dict {
            switch item["entity"] as! String{
            case "Date":
                if let date = Mapper<Date>().map(JSON: item) {
                    res.append(date as Any)
                }
            case "HeaderText":
                if let date = Mapper<HeaderText>().map(JSON: item) {
                    res.append(date as Any)
                }
            case "ImageHeader":
                break
            default:
                return res
            }
        }
        return res
    }
}
