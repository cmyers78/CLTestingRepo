//
//  ViewController.swift
//  enumTest
//
//  Created by Christopher Myers on 4/4/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

enum StringType : Int {
    case firstText, secondText, thirdText
    
    var textForType: String {
        switch self {
        case .firstText:
            return "This is the first text"
        case .secondText:
            return "This is the second text"
        case .thirdText:
            return "This is the third text"
        }
    }
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var labelText: UILabel!
    var count = 1
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchingTextLabel(.firstText)
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        switchingTextLabel(StringType(rawValue: count)!)
        if count < 2 {
            count += 1
        } else {
            count = 0
        }
        
    }
    
    func switchingTextLabel(_ type : StringType) {
        labelText.text = type.textForType
    
    
    }

}

