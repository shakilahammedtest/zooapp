//
//  CustomView.swift
//  Artable
//
//  Created by Ashraf Ahmed on 28/10/19.
//  Copyright © 2019 Shakil Ahammed. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class RoundedButton : UIButton{
    
    @IBInspectable var cornerRadius:CGFloat = 0.0{
        didSet{
            updateView()
        }
    }

    func updateView() {
        self.layer.cornerRadius = cornerRadius
    }
    
    
}


@IBDesignable
class CustomRoundedView:UIView{
    @IBInspectable var cornerRadius: CGFloat = 0.0{
        didSet{
            updateView()
        }
    }
    func updateView() {
        self.layer.cornerRadius = cornerRadius
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
