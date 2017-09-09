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
