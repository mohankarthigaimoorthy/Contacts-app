//
//  UIView.swift
//  contact
//
//  Created by Mohan K on 21/02/23.
//

import Foundation
import UIKit

@IBDesignable class RoundImageView: UIImageView {}
@IBDesignable class RoundView: UIView {}

extension UIView {
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
            
        }
        set { layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
            
        }
    }
    @IBInspectable
    var borderWidth: CGFloat {
        get {return layer.borderWidth}
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable
    var borderColor: UIColor?{
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
        set {layer.borderColor = newValue?.cgColor}
    }
}
