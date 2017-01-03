//
//  ViewController.swift
//  BuildConfigurations
//
//  Created by Christopher Myers on 1/3/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var configuration = Configuration()
        
        print(configuration.environment.baseURL)
        print(configuration.environment.token)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

