//
//  GoogleBtn.swift
//  DragNet
//
//  Created by Cameron Laury on 9/4/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

@IBDesignable
class GoogleBtn: UIButton {
    
    override func draw(_ rect: CGRect) {
        GoogleAndFacebookBtns.drawGoogleCircleButton(frame: self.bounds, resizing: .aspectFit)
    }

}
