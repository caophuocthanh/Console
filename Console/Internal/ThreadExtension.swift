//
//  ThreadExtension.swift
//  Console
//
//  Created by Cao Phuoc Thanh on 4/13/21.
//

import Foundation

internal extension Thread {
    
    var name: String {
        if let currentOperationQueue = OperationQueue.current?.name {
            return currentOperationQueue
        } else if let underlyingDispatchQueue = OperationQueue.current?.underlyingQueue?.label {
            return underlyingDispatchQueue
        } else {
            let name = __dispatch_queue_get_label(nil)
            return String(cString: name, encoding: .utf8) ?? Thread.current.description
        }
    }
}
