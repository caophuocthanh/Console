//
//  DefaultConsoleProvider.swift
//  Console
//
//  Created by Cao Phuoc Thanh on 4/13/21.
//

import Foundation

public struct DefaultConsoleProvider: ConsoleProvider {
    public func mearsure(name: String?, file: String, function: String, interval: TimeInterval) {
        print("[🍭][mearsure]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function)", name ?? "", "► \(interval) seconds")
    }
    public func log(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        print("[⛱][log]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? "")
    }
    public func notice(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        print("[🌶][notice]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? "")
    }
    public func debug(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        print("[🎭][debug]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? "")
    }
    public func error(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        print("[📛][error]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? "")
    }
    public func fault(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        print("[☢️][fault]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? "")
    }
}
