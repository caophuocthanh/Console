//
//  SlackConsoleProvider.swift
//  Console
//
//  Created by Cao Phuoc Thanh on 4/13/21.
//

import Foundation

public struct SlackConsoleProvider {
    
    
    var url: String
    var channel: String
    var username: String
    var icon_emoji: String
    
    public init(url: String, channel: String, username: String, icon_emoji: String = ":calling:") {
        self.url = url
        self.channel = channel
        self.username = username
        self.icon_emoji = icon_emoji
    }
    
    private func send(_ message: String) {
        
        let payload = "payload={\"channel\": \"\(self.channel)\", \"username\": \"\(self.username)\", \"icon_emoji\":\"\(self.icon_emoji)\", \"text\": \"\(message)\"}"
        print("payload:", payload)
        let data = payload.data(using: .utf8)!
        if let url = NSURL(string: self.url){
            let request = NSMutableURLRequest(url: url as URL)
            request.httpMethod = "POST"
            request.httpBody = data
            let session = URLSession.shared
            let task = session.dataTask(with: request as URLRequest){
                (data, response, error) -> Void in
                if error != nil {
                    print("error")
                }
                else if data != nil {
                    if let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue) {
                        print("\(str)")
                    }
                    else {
                        print("error")
                    }
                }
            }
            task.resume()
        }
        else {
            print("url invalid")
        }
    }
    
}

extension SlackConsoleProvider: ConsoleProvider {
    
    public func mearsure(name: String?, file: String, function: String, interval: TimeInterval) {
        let message = ["[🍭][mearsure]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function)", name ?? "", "► \(interval) seconds"].joined(separator: " ")
        print()
        self.send(message)
    }
    public func log(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        let message = ["[⛱][log]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? ""].joined(separator: terminator)
        self.send(message)
    }
    public func notice(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        let message = ["[🌶][notice]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? ""].joined(separator: terminator)
        self.send(message)
    }
    public func debug(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        let message = ["[🌶][debug]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? ""].joined(separator: terminator)
        self.send(message)
    }
    public func error(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        let message = ["[📛][error]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? ""].joined(separator: terminator)
        self.send(message)
    }
    public func fault(_ items: Any..., separator: String, terminator: String, file: String, function: String) {
        let message = ["[☢️][fault]","[\(Date())]","[\(file.components(separatedBy: "/").last ?? "")]","[\(Thread.current.name)] \(function) ►",(items.first as? [Any])?.map { "\($0)"}.joined(separator: separator) ?? ""].joined(separator: terminator)
        self.send(message)
    }
    
    
}
