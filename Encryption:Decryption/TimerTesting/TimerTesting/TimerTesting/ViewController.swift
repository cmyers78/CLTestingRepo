//
//  ViewController.swift
//  TimerTesting
//
//  Created by Christopher Myers on 11/21/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
 
    let newTimer = InactivityTimer()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        newTimer.runTimer()
    }


}

