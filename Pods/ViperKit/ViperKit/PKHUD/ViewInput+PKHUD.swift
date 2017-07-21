//
//  ViewInput+PKHUD.swift
//  Pods
//
//  Created by George Kiriy on 06/11/2016.
//
//

import PKHUD

public extension ViewInput {
    func startIndication() {
        HUD.show(.progress)
    }
    
    func stopIndication() {
        HUD.hide()
    }
    
    func showSuccess() {
        HUD.flash(.success)
    }
    
    func showMessage(message: String) {
        HUD.flash(.label(message), delay: 3.0)
    }
    
    func showError(error: String) {
        HUD.flash(.labeledError(title: error, subtitle: nil), delay: 3.0)
    }
    
    func showError() {
        HUD.flash(.error)
    }
}

