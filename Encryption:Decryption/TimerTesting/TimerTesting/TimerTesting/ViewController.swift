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
    
    let notification = NotificationCenter.default
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newTimer.runTimer()
        newTimer.createNotificationToStopTimer()
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        newTimer.createListenerToStartTimer()
    }
    

}

