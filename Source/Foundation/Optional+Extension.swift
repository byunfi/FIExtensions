//
//  Optional+Extension.swift
//  FIExtensions
//
//  Created by byyyf on 6/7/16.
//  Copyright © 2016 byyyf. All rights reserved.
//

import UIKit

public extension Optional {
    // Int
    public var int: Int? {
        return self as? Int
    }
    
    public var intValue: Int {
        return self as? Int ?? 0
    }
    
    // String
    public var string: String? {
        return self as? String
    }
    
    public var stringValue: String {
        return self as? String ?? ""
    }
    
    // Bool
    public var bool: Bool? {
        return self as? Bool
    }
    
    public var boolValue: Bool {
        return self as? Bool ?? false
    }
    
    public var isNil: Bool {
        return self == nil
    }
    
    // CGFloat
    public var cgFloat: CGFloat? {
        return self as? CGFloat
    }
    
    public var cgFloatValue: CGFloat {
        return self as? CGFloat ?? 0
    }
    
    // Array
    public var array: NSArray? {
        return self as? NSArray
    }
    
    public var arrayValue: NSArray {
        return self as? NSArray ?? []
    }
    
    public var dictionary: NSDictionary? {
        return self as? NSDictionary
    }
}

