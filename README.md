# Console
It is a structure for log in app. Pull this repo and custome it like you want.

```swift
        console.log("log", 1)
        
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
## Result

```
["log", 1]
[🍌][2021-04-13 02:36:47 +0000][ViewController.swift][NSOperationQueue Main Queue] viewDidLoad()  ► mearsure: 1.0006990432739258 seconds
[🍌][2021-04-13 02:36:49 +0000][ViewController.swift][NSOperationQueue Main Queue] idontknow()  ► mearsure: 2.0006778240203857 seconds
["a:", 1000]
```


## Contact
- Email: caophuocthanh@gmail.com
- Site: https://onebuffer.com
- Linkedin: https://www.linkedin.com/in/caophuocthanh/
