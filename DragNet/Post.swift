//
//  Post.swift
//  DragNet
//
//  Created by Cameron Laury on 9/15/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import Foundation

class Post {
    var caption: String
    var photoURL: String
    
    init(captionText: String, photoURLString: String) {
        caption = captionText
        photoURL = photoURLString
    }
}
