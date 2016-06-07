//
//  Thread+Extension.swift
//  FIExtensions
//
//  Created by byyyf on 6/7/16.
//  Copyright © 2016 byyyf. All rights reserved.
//

import Foundation

public func dispatchInMainQueue(action: () -> Void) {
    if pthread_main_np() == 0 {
        dispatch_async(dispatch_get_main_queue()) {
            action()
        }
    } else {
        action()
    }
}