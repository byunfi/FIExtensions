//
//  UIImage+Extension.swift
//  FIExtensions
//
//  Created by byyyf on 6/7/16.
//  Copyright © 2016 byyyf. All rights reserved.
//

import UIKit

public extension UIImage {
    
    public func tintImageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let rect = CGRect(origin: CGPoint.zero, size: self.size)
        color.set()
        UIRectFill(rect)
        self.drawAtPoint(CGPoint.zero, blendMode: .DestinationIn, alpha: 1)
        let tintImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return tintImage
    }
    
    public func roundImage(
        radius: CGFloat,
        borderWidth: CGFloat? = nil,
        borderColor: UIColor? = nil,
        borderLineJoin: CGLineJoin? = nil) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()
        let rect = CGRect(origin: CGPoint.zero, size: self.size)
        CGContextScaleCTM(context, 1, -1);
        CGContextTranslateCTM(context, 0, -rect.size.height)
        
        let minSize = min(self.size.width, self.size.height)
        
        if let
            borderWidth = borderWidth,
            borderColor = borderColor,
            borderLineJoin = borderLineJoin
            where borderWidth > 0 && borderWidth < minSize / 2 && borderColor != .clearColor() {
            
            let path = UIBezierPath(roundedRect: CGRectInset(rect, borderWidth, borderWidth), cornerRadius: radius)
            path.closePath()
            CGContextSaveGState(context)
            path.addClip()
            CGContextDrawImage(context, rect, self.CGImage)
            CGContextRestoreGState(context)
            
            let strokeInset = (floor(borderWidth * self.scale) + 0.5) / self.scale
            let strokeRect = CGRectInset(rect, strokeInset, strokeInset)
            let strokeRadius = radius > self.scale / 2 ? radius - self.scale / 2 : 0
            let strokePath = UIBezierPath(roundedRect: strokeRect, cornerRadius: strokeRadius)
            strokePath.lineWidth = borderWidth;
            strokePath.lineJoinStyle = borderLineJoin;
            borderColor.setStroke()
            strokePath.stroke()
        }
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
