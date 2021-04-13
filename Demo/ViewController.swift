//
//  ViewController.swift
//  Demo
//
//  Created by Cao Phuoc Thanh on 4/13/21.
//

import UIKit
import Console

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
    }
    



}

