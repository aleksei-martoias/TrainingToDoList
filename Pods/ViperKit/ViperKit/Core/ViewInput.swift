//
//  ViewInput.swift
//  MListing-Viper-iOS
//
//  Created by George Kiriy on 12/08/16.
//  Copyright © 2016 SMediaLink. All rights reserved.
//

public protocol ViewInput {
    func startIndication()
    func stopIndication()
    
    func showSuccess()
    func showMessage(message: String)
    
    func showError(error: String)
    func showError()
}
