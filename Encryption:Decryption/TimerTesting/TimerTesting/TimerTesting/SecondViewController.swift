//
//  SecondViewController.swift
//  TimerTesting
//
//  Created by Christopher Myers on 11/22/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bTimer = InactivityTimer()
        
        bTimer.runTimer()
        print("on second screen")
        bTimer.createListenerToStopTimer()
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
