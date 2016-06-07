//
//  CALayer+Extension.swift
//  FIExtensions
//
//  Created by byyyf on 6/7/16.
//  Copyright © 2016 byyyf. All rights reserved.
//

import UIKit

public extension CALayer {
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
        get { return frame.origin.x + frame.size.width * 0.5 }
        set { frame.origin.x = newValue - frame.size.width * 0.5 }
    }
    
    public var centerY: CGFloat {
        get { return frame.origin.y + frame.size.height * 0.5 }
        set { frame.origin.y = newValue - frame.size.height * 0.5 }
    }
    
    public var transformRotation: CGFloat {
        get {
            return valueForKeyPath("transform.rotation") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.rotation")
        }
    }
    
    public var transformRotationX: CGFloat {
        get {
            return valueForKeyPath("transform.rotation.x") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.rotation.x")
        }
    }
    
    public var transformRotationY: CGFloat {
        get {
            return valueForKeyPath("transform.rotation.y") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.rotation.y")
        }
    }
    
    public var transformRotationZ: CGFloat {
        get {
            return valueForKeyPath("transform.rotation.z") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.rotation.z")
        }
    }
    
    public var transformScaleX: CGFloat {
        get {
            return valueForKeyPath("transform.scale.x") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.scale.x")
        }
    }
    
    public var transformScaleY: CGFloat {
        get {
            return valueForKeyPath("transform.scale.y") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.scale.y")
        }
    }
    
    public var transformScaleZ: CGFloat {
        get {
            return valueForKeyPath("transform.scale.z") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.scale.z")
        }
    }
    
    public var transformScale: CGFloat {
        get {
            return valueForKeyPath("transform.scale") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.scale")
        }
    }
    
    public var transformTranslationX: CGFloat {
        get {
            return valueForKeyPath("transform.translation.x") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.translation.x")
        }
    }
    
    public var transformTranslationY: CGFloat {
        get {
            return valueForKeyPath("transform.translation.y") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.translation.y")
        }
    }
    
    public var transformTranslationZ: CGFloat {
        get {
            return valueForKeyPath("transform.translation.z") as! CGFloat
        }
        set {
            setValue(newValue, forKeyPath: "transform.translation.z")
        }
    }
    
    public var transformDepth: CGFloat {
        get {
            return self.transform.m34
        }
        set {
            var d = self.transform;
            d.m34 = newValue;
            self.transform = d
        }
    }
}
