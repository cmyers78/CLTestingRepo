//
//  ViewController.swift
//  ApplicationTerminate
//
//  Created by Christopher Myers on 2/15/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(throwAway), name: NSNotification.Name(rawValue: "terminate"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func throwAway() {
        print("Application terminating.  Saving data")
        print("Keep it between the lines")
        
        endGame()
    }

    func endGame() {
        
        print("Ending Game. Collect Data")
        
        for i in 1...10 {
            print("Counting: \(i)")
        }
    }
}

