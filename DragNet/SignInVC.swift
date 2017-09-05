//
//  SignInVC.swift
//  DragNet
//
//  Created by Cameron Laury on 9/4/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class SignInVC: UIViewController {

    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signInBtn.layer.cornerRadius = 12

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookBtnTapped(_ sender: Any) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to authenticate with Facebook")
            } else if result?.isCancelled == true {
                print("User cancelled Facebook authentication")
            } else {
                print("Authenticated with Facebook!")
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                self.firebaseAuth(credential)
            }
            
        }
        
    }
    
    func firebaseAuth(_ credential: FIRAuthCredential) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
            if error != nil {
                print("Unable to authenticate with Firebase")
            } else {
                print("Successfully authenticated with Firebase!")
            }
            
        })
    }
}


