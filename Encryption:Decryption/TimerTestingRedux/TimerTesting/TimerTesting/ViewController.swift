//
//  ViewController.swift
//  TimerTesting
//
//  Created by Christopher Myers on 1/23/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var timer = Timer()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 50, target: self, selector: #selector(inactiveSubmit), userInfo: nil, repeats: false)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func inactiveSubmit() {
        
        print("I'm now submitting my user info passively")
        timer.invalidate()
        
        
        let secondVC = (self.storyboard?.instantiateViewController(withIdentifier: "vc3"))
        secondVC?.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        self.present(secondVC!, animated: true, completion: nil)
        
        
    }

}

