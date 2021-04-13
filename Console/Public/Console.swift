//
//  Console.swift
//  Console
//
//  Created by Cao Phuoc Thanh on 4/13/21.
//  https://developer.apple.com/documentation/os/logging/generating_log_messages_from_your_code

import Foundation

public let console: Console = Console(provider: DefaultConsoleProvider())

public struct Console {
    
    public var provider: ConsoleProvider
    
    public init(provider: ConsoleProvider) {
        self.provider = provider
    }
    
    // Mearsure time excute
    @discardableResult
    public func mearsure<T>(name: String? = nil, _ block : (() -> T), file: String = #file, function : String = #function) -> T {
        #if DEBUG
        let from = Date().timeIntervalSince1970
        let result: T = block()
        let to = Date().timeIntervalSince1970
        let seconds = to - from
        self.provider.mearsure(name: name, file: file, function: function, interval: seconds)
        return result
        #else
        let result: T = block()
        return result
        #endif
    }
    
    // Captures information that is helpful, but not essential, to troubleshoot problems.
    public func log(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, function : String = #function) {
        #if DEBUG
        self.provider.log(items, separator: separator, terminator: terminator, file: file, function: function)
        #endif
    }
    
    // Captures information that is essential for troubleshooting problems. For example, capture information that might result in a failure.
    public func notice(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, function : String = #function) {
        #if DEBUG
        self.provider.log(items, separator: separator, terminator: terminator, file: file, function: function)
        #endif
    }
    
    // Captures verbose information during development that is useful only for debugging your code.
    public func debug(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, function : String = #function) {
        #if DEBUG
        self.provider.log(items, separator: separator, terminator: terminator, file: file, function: function)
        #endif
    }
    
    // Captures errors seen during the execution of your code. If an activity object exists, the system captures information for the related process chain.
    public func error(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, function : String = #function) {
        #if DEBUG
        self.provider.log(items, separator: separator, terminator: terminator, file: file, function: function)
        #endif
    }
    
    // Captures information about faults and bugs in your code. If an activity object exists, the system captures information for the related process chain.
    public func fault(_ items: Any..., separator: String = " ", terminator: String = "\n", file: String = #file, function : String = #function) {
        #if DEBUG
        self.provider.log(items, separator: separator, terminator: terminator, file: file, function: function)
        #endif
    }
    
}


