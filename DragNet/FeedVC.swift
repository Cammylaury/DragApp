//
//  FeedVC.swift
//  DragNet
//
//  Created by Cameron Laury on 9/5/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase
import DZNEmptyDataSet

class FeedVC: UIViewController {
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print(keychainResult)
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
}
