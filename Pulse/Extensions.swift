//
//  Extensions.swift
//  Pulse
//
//  Created by Jan Senderek on 12/23/17.
//  Copyright © 2017 Jan Senderek. All rights reserved.
//

import UIKit

extension UIColor {
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
    
    static let backgroundColor = UIColor.rgb(r: 37, g: 40, b: 43)
    static let buttonLayerFillColor = UIColor.rgb(r: 252, g: 202, b: 0)
    static let pulsatingLayerFillColor = UIColor.rgb(r: 153, g: 110, b: 0)
    
}
