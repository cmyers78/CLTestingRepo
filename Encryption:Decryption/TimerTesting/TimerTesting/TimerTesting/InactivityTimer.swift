//
//  InactivityTimer.swift
//  TimerTesting
//
//  Created by Christopher Myers on 11/21/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class InactivityTimer: NSObject {
    
    var seconds : Int = 0
    var myTimer : Timer?
    let notification = NotificationCenter.default
    
    
    override init() {
        super.init()
    }
    
//    init(startTimer : Int, aTimer : Timer) {
//        super.init()
//        
//        self.seconds = startTimer
//        self.myTimer = aTimer
//    }
    
    func track() {
        self.seconds += 1
        print(self.seconds)
        
        if self.seconds == 8 {
            print("About to reset timer...")
        }
        else if self.seconds == 20 {
            print("Resetting timer")
            self.myTimer?.invalidate()
            print("you took too long fuckwad")
            self.seconds = 0
            self.runTimer()
            
        }
    }
    
    func runTimer() {
        myTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in
            self.track()
        })
    }
    
    func invalidateTimer() {
        myTimer?.invalidate()
        self.seconds = 0
    }
    
    func createNotificationToStopTimer() {
        notification.addObserver(self, selector: #selector(invalidateTimer), name: NSNotification.Name(rawValue: "postNotificationToStopTimer"), object: nil)
    }
    
    func createListenerToStopTimer() {
        notification.post(name: NSNotification.Name(rawValue: "postNotificationToStopTimer"), object: nil)
    }
    
    func createNotificationToStartTimer() {
        notification.addObserver(self, selector: #selector(runTimer), name: NSNotification.Name(rawValue: "postNotificationToStartTimer"), object: nil)
    }
    
    func createListenerToStartTimer() {
        notification.post(name: NSNotification.Name(rawValue: "postNotificationToStartTimer"), object: nil)
        
    }

}
