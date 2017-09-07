
//
//  SettingsVC.swift
//  DragNet
//
//  Created by Cameron Laury on 9/6/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper
import Firebase
import FBSDKCoreKit
import FacebookLogin
import FacebookCore
import FBSDKCoreKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print(keychainResult)
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
    
}
