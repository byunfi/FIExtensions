//
//  String+Extension.swift
//  FIExtensions
//
//  Created by byyyf on 6/7/16.
//  Copyright © 2016 byyyf. All rights reserved.
//

import Foundation

public extension String {
    /**
     Returns a string object containing the characters of the String that lie within a given range.
     */
    public func substringWithNSRange(range: NSRange) -> String {
        let from = startIndex.advancedBy(range.location)
        let to = from.advancedBy(range.length)
        return substringWithRange(from ..< to)
    }
}