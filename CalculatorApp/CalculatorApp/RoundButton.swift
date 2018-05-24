//
//  RoundButton.swift
//  CalculatorApp
//
//  Created by Apple on 01/05/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var roundButton:Bool = false{
        didSet{
            if roundButton{
                layer.cornerRadius = frame.height/2
            }
        }
    }
    override func prepareForInterfaceBuilder() {
        if roundButton {
            layer.cornerRadius = frame.height / 2
        }
    }

   

}
