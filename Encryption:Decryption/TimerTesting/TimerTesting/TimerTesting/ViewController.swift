//
//  ViewController.swift
//  TimerTesting
//
//  Created by Christopher Myers on 11/21/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var seconds = 0.0
    var myTimer = Timer()
    var aTimer : Timer?
    var bTimer = Timer?.self
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.runTimer()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func track() {
        self.seconds += 1
        print(self.seconds)
        
        if self.seconds == 8 {
            print("About to reset timer...")
            
            
        }
        else if self.seconds == 10 {
            print("Resetting timer")
            self.aTimer?.invalidate()
            self.seconds = 0
            self.runTimer()
            
        }

    }

    func runTimer() {
        aTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
            self.track()
        })
        

    }

}

