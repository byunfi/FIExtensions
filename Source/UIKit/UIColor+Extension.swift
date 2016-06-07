//
//  UIColor+Extension.swift
//  FIExtensions
//
//  Created by byyyf on 6/7/16.
//  Copyright © 2016 byyyf. All rights reserved.
//

import UIKit

public extension UIColor {
    
    // MARK:- Init
    
    /**
     The shorthand three-digit hexadecimal representation of color.
     #RGB defines to the color #RRGGBB.
     
     - parameter hex3: Three-digit hexadecimal value.
     - parameter alpha: 0.0 - 1.0. The default is 1.0.
     */
    public convenience init(hex3: UInt16, alpha: CGFloat = 1) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex3 & 0xF00) >> 8) / divisor
        let green   = CGFloat((hex3 & 0x0F0) >> 4) / divisor
        let blue    = CGFloat( hex3 & 0x00F      ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The shorthand four-digit hexadecimal representation of color with alpha.
     #RGBA defines to the color #RRGGBBAA.
     
     - parameter hex4: Four-digit hexadecimal value.
     */
    public convenience init(hex4: UInt16) {
        let divisor = CGFloat(15)
        let red     = CGFloat((hex4 & 0xF000) >> 12) / divisor
        let green   = CGFloat((hex4 & 0x0F00) >>  8) / divisor
        let blue    = CGFloat((hex4 & 0x00F0) >>  4) / divisor
        let alpha   = CGFloat( hex4 & 0x000F       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The six-digit hexadecimal representation of color of the form #RRGGBB.
     
     - parameter hex6: Six-digit hexadecimal value.
     */
    public convenience init(hex6: UInt32, alpha: CGFloat = 1) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The six-digit hexadecimal representation of color with alpha of the form #RRGGBBAA.
     
     - parameter hex8: Eight-digit hexadecimal value.
     */
    public convenience init(hex8: UInt32) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex8 & 0xFF000000) >> 24) / divisor
        let green   = CGFloat((hex8 & 0x00FF0000) >> 16) / divisor
        let blue    = CGFloat((hex8 & 0x0000FF00) >>  8) / divisor
        let alpha   = CGFloat( hex8 & 0x000000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /**
     The rgba string representation of color with alpha of the form #RRGGBBAA/#RRGGBB, throws error.
     
     - parameter rgba: String value.
     */
    public convenience init?(hexString: String) {
        guard hexString.hasPrefix("#") else {
            return nil
        }
        
        guard let hexString: String = hexString.substringFromIndex(hexString.startIndex.advancedBy(1)),
            var   hexValue:  UInt32 = 0
            where NSScanner(string: hexString).scanHexInt(&hexValue) else {
                return nil
        }
        
        switch (hexString.characters.count) {
        case 3:
            self.init(hex3: UInt16(hexValue))
        case 4:
            self.init(hex4: UInt16(hexValue))
        case 6:
            self.init(hex6: hexValue)
        case 8:
            self.init(hex8: hexValue)
        default:
            return nil
        }
    }
    
    /**
     Hex string of a UIColor instance.
     
     - parameter rgba: Whether the alpha should be included.
     */
    public func hexString(includeAlpha: Bool) -> String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        if (includeAlpha) {
            return String(format: "#%02X%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255), Int(a * 255))
        } else {
            return String(format: "#%02X%02X%02X", Int(r * 255), Int(g * 255), Int(b * 255))
        }
    }
    
    public override var description: String {
        return self.hexString(true)
    }
    
    public override var debugDescription: String {
        return self.hexString(true)
    }
    
    /**
     The white component value of the color in RGB color space (0 ~ 1).
     */
    public var white: CGFloat {
        var white: CGFloat = 0
        getWhite(&white, alpha: nil)
        return white
    }
    
    /**
     The red component value of the color in RGB color space (0 ~ 1).
     */
    public var red: CGFloat {
        var red: CGFloat = 0
        getRed(&red, green: nil, blue: nil, alpha: nil)
        return red
    }
    
    /**
     The green component value of the color in RGB color space (0 ~ 1).
     */
    public var green: CGFloat {
        var green: CGFloat = 0
        getRed(nil, green: &green, blue: nil, alpha: nil)
        return red
    }
    
    /**
     The blue component value of the color in RGB color space (0 ~ 1).
     */
    public var blue: CGFloat {
        var blue: CGFloat = 0
        getRed(nil, green: nil, blue: &blue, alpha: nil)
        return red
    }
    
    /**
     The alpha component value of the color in RGB color space (0 ~ 1).
     */
    public var alpha: CGFloat {
        var alpha: CGFloat = 0
        getRed(nil, green: nil, blue: nil, alpha: &alpha)
        return alpha
    }
    
    /**
     Create a pixel size of the image using this color.
     Opaque while the color has alpha channel.
     */
    public var image: UIImage {
        let cgColor = self.CGColor
        let alpha = CGColorGetAlpha(cgColor)
        let rect = CGRectMake(0, 0, 1.0, 1.0)
        UIGraphicsBeginImageContextWithOptions(rect.size, alpha == 1, UIScreen.mainScreen().scale)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, cgColor)
        CGContextFillRect(context, rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    public func darkenByPercentage(percentage: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            if (percentage > 0) {
                b = min(b - percentage, 1)
            }
            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
        }
        return self
    }
    
    public func lightenByPercentage(percentage: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            if (percentage > 0) {
                b = min(b + percentage, 1)
            }
            return UIColor(hue: h, saturation: s, brightness: b, alpha: a)
        }
        return self
    }
}

