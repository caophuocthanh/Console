# Console
It is a structure for log in app. Pull this repo and custome it like you want.

## Todo

- [x] Console log cumtom
- [x] Provide an provider to custom log
- [x] DefaultConsoleProvider
- [ ] StorageConsoleProvider // storage logs by StorageConsoleProvider
- [ ] SlackConsoleProvider // push logs to Slack by custom provider SlackConsoleProvider

### How it work

```swift
        console.log("log", 1, "hello", "who you are", Date(), self)
        
        console.mearsure {
            sleep(1)
        }
        
        func idontknow() -> Int {
            console.mearsure {
                sleep(2)
                return 1000
            }
        }
        
        let a = idontknow()
        console.log("a:", a)

```
### Result

```
[⛱][log] [2021-04-13 05:48:58 +0000] [ViewController.swift] [NSOperationQueue Main Queue] viewDidLoad() ► log 1 hello who you are 2021-04-13 05:48:58 +0000 <Demo.ViewController: 0x7feab1e06540>
[🍭][mearsure] [2021-04-13 05:48:59 +0000] [ViewController.swift] [NSOperationQueue Main Queue] viewDidLoad()  ► 1.0 seconds
[🍭][mearsure] [2021-04-13 05:49:01 +0000] [ViewController.swift] [NSOperationQueue Main Queue] idontknow()  ► 2.001002073287964 seconds
[⛱][log] [2021-04-13 05:49:01 +0000] [ViewController.swift] [NSOperationQueue Main Queue] viewDidLoad() ► a: 1000
```

## Custom Provider

```swift
public struct YourCustomConsoleProvider: ConsoleProvider {
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

console.provider = YourCustomConsoleProvider()

```

## Contact
- Email: caophuocthanh@gmail.com
- Site: https://onebuffer.com
- Linkedin: https://www.linkedin.com/in/caophuocthanh/
