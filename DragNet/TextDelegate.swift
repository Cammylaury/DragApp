//
//  TextDelegate.swift
//  DragNet
//
//  Created by Cameron Laury on 9/9/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

class textDelegate: NSObject, UITextFieldDelegate {
    
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        return
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}
