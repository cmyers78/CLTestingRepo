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
        
        notification.addObserver(self, selector: #selector(ViewController.postNotificationToStopTimer), name: NSNotification.Name(rawValue: "postNotificationToStopTimer"), object: nil)
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        newTimer.runTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    func postNotificationToStopTimer() {
        print("sending notification to stop timer")
        newTimer.invalidateTimer()
    }
}

