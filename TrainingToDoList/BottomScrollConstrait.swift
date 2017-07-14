//
//  BottomScrollConstrait.swift
//  TrainingToDoList
//
//  Created by Aleksey Martoyas on 14.07.17.
//  Copyright © 2017 Aleksey Martoyas. All rights reserved.
//

import UIKit

class BottomScrollConstrait: NSLayoutConstraint {
    
    override func awakeFromNib() {
        subscribeForNotifications()
    }
    
    @objc func upConstant(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue
        let keyboardRectangle = keyboardFrame.cgRectValue
        let keyboardHeight = keyboardRectangle.height
        
        self.constant = keyboardHeight
    }
    
    @objc func downConstant() {
        self.constant = 0
    }
    
    func subscribeForNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(upConstant(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(downConstant), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
