//
//  UIView+Extension.swift
//  FIExtensions
//
//  Created by byyyf on 6/7/16.
//  Copyright © 2016 byyyf. All rights reserved.
//

import UIKit

public extension UIView {
    
    public var left: CGFloat {
        get { return frame.origin.x }
        set { frame.origin.x = newValue }
    }
    
    public var right: CGFloat {
        get { return frame.origin.x + frame.width }
        set { frame.origin.x = newValue - frame.width }
    }
    
    
    public var top: CGFloat {
        get { return frame.origin.y }
        set { frame.origin.y = newValue }
    }
    
    public var bottom: CGFloat {
        get { return frame.origin.y + frame.height }
        set { frame.origin.y = newValue - frame.height }
    }
    
    
    public var height: CGFloat {
        get { return frame.height }
        set { frame.size.height = newValue }
    }
    
    public var width: CGFloat {
        get { return frame.width }
        set { frame.size.width = newValue }
    }
    
    public var origin: CGPoint {
        get { return frame.origin }
        set { frame.origin = newValue }
    }
    
    public var size: CGSize {
        get { return frame.size }
        set { frame.size = newValue }
    }
    
    public var centerX: CGFloat {
        get { return center.x }
        set { center.x = newValue }
    }
    
    public var centerY: CGFloat {
        get { return center.y }
        set { center.y = newValue }
    }
    
    public var snapshotImage: UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0)
        if let context = UIGraphicsGetCurrentContext() {
            layer.renderInContext(context)
        }
        let snap = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext()
        return snap
    }
    
    public var viewController: UIViewController? {
        var view: UIView? = self
        while view != nil {
            if let nextResponder = view!.nextResponder() as? UIViewController {
                return nextResponder
            }
            view = view!.superview
        }
        return nil
    }
    
    public func setLayerShadow(
        color: UIColor?,
        offset: CGSize?,
        radius: CGFloat?,
        opacity: Float?) {
        
        if let color = color {
            layer.shadowColor = color.CGColor
        }
        if let offset = offset {
            layer.shadowOffset = offset
        }
        if let radius = radius {
            layer.shadowRadius = radius
        }
        if let opacity = opacity {
            layer.shadowOpacity = opacity
        }
    }
}
