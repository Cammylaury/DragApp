//
//  UserNameVC.swift
//  DragNet
//
//  Created by Cameron Laury on 9/7/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase
import SwiftKeychainWrapper

class UserNameVC: UIViewController {
    
    var email: String!
    var password: String!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var profileImage: UIImageView!
    
    var selectedImage: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImage.layer.cornerRadius = 40
        profileImage.clipsToBounds = true
     
        
        let profileTapped = UITapGestureRecognizer(target: self, action: #selector(UserNameVC.handleSelectProfileImageView))
        profileImage.addGestureRecognizer(profileTapped)
        profileImage.isUserInteractionEnabled = true
        

    }
    
    func handleSelectProfileImageView() {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func createUsernameAndImage(_ sender: Any) {
        FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user: FIRUser?, error: Error?) in
            if error != nil {
                print("Created!")
                return
            }
            
            let uid = user?.uid
            let storageRef = FIRStorage.storage().reference(forURL: "gs://dragnet-3b349.appspot.com").child("profileImage").child(uid!)
            
            if let profileImg = self.selectedImage, let imageData = UIImageJPEGRepresentation(profileImg, 0.1) {
                storageRef.put(imageData, metadata: nil, completion: { (metadata, error) in
                    
                    if error != nil {
                        return
                    }
                    
                    let profileImageURL = metadata?.downloadURL()?.absoluteString
                    let ref = FIRDatabase.database().reference()
                    let userReference = ref.child("users")
                    
                    let newUserReference = userReference.child(uid!)
                    newUserReference.setValue(["Username" : self.usernameTextField.text!, "email" : self.email!, "profileImageURL" : profileImageURL])
                    
                })
            }
            
            
        })
        
        performSegue(withIdentifier: "toFeed", sender: nil)
        
        
    }

}

extension UserNameVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            selectedImage = image
            profileImage.image = image
        }
        
        dismiss(animated: true, completion: nil)
    }
}
