//
//  ViewController.swift
//  buttonPressingGathering
//
//  Created by Christopher Myers on 1/9/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberOne: UILabel!
    
    var numberButtons = [UIButton]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.numberOne.text = ""
        
        for subview in view.subviews where subview.tag == 200 {
            let btn = subview as! UIButton
            numberButtons.append(btn)
            btn.addTarget(self, action: #selector(numberTapped), for: .touchUpInside)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberTapped(btn : UIButton) {
    
        numberOne.text = numberOne.text! + btn.titleLabel!.text!
        
    }
    
    
}

