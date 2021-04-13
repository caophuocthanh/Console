//
//  ConsoleProvider.swift
//  Console
//
//  Created by Cao Phuoc Thanh on 4/13/21.
//

import Foundation

public protocol ConsoleProvider {
    
    func mearsure(name: String?, file: String, function: String, interval: TimeInterval)
    
    // Captures information that is helpful, but not essential, to troubleshoot problems.
     func log(_ items: Any..., separator: String, terminator: String, file: String, function: String)
    
    // Captures information that is essential for troubleshooting problems. For example, capture information that might result in a failure.
     func notice(_ items: Any..., separator: String, terminator: String, file: String, function: String)
    
    // Captures verbose information during development that is useful only for debugging your code.
     func debug(_ items: Any..., separator: String, terminator: String, file: String, function: String)
    
    // Captures errors seen during the execution of your code. If an activity object exists, the system captures information for the related process chain.
     func error(_ items: Any..., separator: String, terminator: String, file: String, function: String)
    
    // Captures information about faults and bugs in your code. If an activity object exists, the system captures information for the related process chain.
     func fault(_ items: Any..., separator: String, terminator: String, file: String, function: String)
    
}
