//
//  UIScrollView+Extension.swift
//  FIExtensions
//
//  Created by byyyf on 6/7/16.
//  Copyright © 2016 byyyf. All rights reserved.
//

import UIKit

public extension UIScrollView {
    
    public func scrollToTop(animated: Bool = true) {
        var offset = self.contentOffset
        offset.y = -self.contentInset.top
        setContentOffset(offset, animated: animated)
    }
}
