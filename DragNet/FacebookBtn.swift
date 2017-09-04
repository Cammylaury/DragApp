//
//  FacebookButton.swift
//  DragNet
//
//  Created by Cameron Laury on 9/4/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

@IBDesignable
class FacebookBtn: BounceButton {
    
    override func draw(_ rect: CGRect) {
        GoogleAndFacebookBtns.drawFacebookCircleButton(frame: self.bounds, resizing: .aspectFit)
    }


}
