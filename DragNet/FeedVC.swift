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
import FirebaseDatabase
import FaveButton

class FeedVC: UIViewController {
    
    @IBOutlet weak var likeButton: FaveButton!
    
    @IBInspectable public var normalColor: UIColor!
    @IBInspectable public var selectedColor: UIColor!
    @IBInspectable public var dotFirstColor: UIColor!
    @IBInspectable public var dotSecondColor: UIColor!
    @IBInspectable public var circleFromColor: UIColor!
    @IBInspectable public var circleToColor: UIColor!
    
    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        loadPosts()
        var post = Post(captionText: "test", photoURLString: "testUrl")

    }
    
    func loadPosts() {
        FIRDatabase.database().reference().child("posts").observe(.childAdded) { (snapshot: FIRDataSnapshot) in
            print(snapshot.value)
            
            if let dict = snapshot.value as? [String: Any] {
                let captionText = dict["cpation"] as! String
                let photoURLString = dict["photoURLString"] as! String
                let post = Post(captionText: "", photoURLString: "")
                self.posts.append(post)
                print(dict)
                self.tableView.reloadData()
            }
            
        }
    }
    
    @IBAction func signOutTapped(_ sender: Any) {
        let keychainResult = KeychainWrapper.standard.remove(key: KEY_UID)
        print(keychainResult)
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignIn", sender: nil)
    }
}

extension FeedVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        cell.textLabel?.text = posts[indexPath.row].caption
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
}
