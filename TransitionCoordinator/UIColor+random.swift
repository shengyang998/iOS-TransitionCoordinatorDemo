//
//  UIColor+random.swift
//  DeselectRowTheBestWay
//
//  Created by kemchenj on 2018/12/24.
//  Copyright © 2018 kemchenj. All rights reserved.
//

import UIKit

extension UIColor {

    static func random() -> UIColor {
        let validRGBRange: ClosedRange<CGFloat> = 0...255
        var randomRGBValue: CGFloat { return CGFloat.random(in: validRGBRange) / 255 }

        return UIColor(
            red: randomRGBValue,
            green: randomRGBValue,
            blue: randomRGBValue,
            alpha: 1
        )
    }
    
    static func randomLight() -> UIColor {
        let validRGBRange: ClosedRange<CGFloat> = 240...255
        var randomRGBValue: CGFloat { return CGFloat.random(in: validRGBRange) / 255 }
        
        return UIColor(
            red: randomRGBValue,
            green: randomRGBValue,
            blue: randomRGBValue,
            alpha: 1
        )
    }
    
    static func randomDark() -> UIColor {
        let validRGBRange: ClosedRange<CGFloat> = 50...100
        var randomRGBValue: CGFloat { return CGFloat.random(in: validRGBRange) / 255 }
        
        return UIColor(
            red: randomRGBValue,
            green: randomRGBValue,
            blue: randomRGBValue,
            alpha: 1
        )
    }

    
}
