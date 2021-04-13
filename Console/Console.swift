//
//  Console.swift
//  Console
//
//  Created by Cao Phuoc Thanh on 4/13/21.
//

import Foundation

public let console: Console = Console()

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

public struct Console {
    
    @discardableResult
    public func mearsure<T>(name: String? = nil, _ block : (() -> T), file: String = #file, function : String = #function) -> T {
        #if DEBUG
        let from = Date().timeIntervalSince1970
        let result: T = block()
        let to = Date().timeIntervalSince1970
        let seconds = to - from
        //print("\(function) \(name ?? "") ►► mearsure \(seconds) seconds")
        print("[🍌][\(Date())][\(file.components(separatedBy: "/").last ?? "")][\(Thread.current.name)] \(function)", name ?? "", "► mearsure: \(seconds) seconds")
        return result
        #else
        let result: T = block()
        return result
        #endif
    }
    
    public func log(_ items: Any..., separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        print(items, separator: separator, terminator: terminator)
        #endif
    }
}


