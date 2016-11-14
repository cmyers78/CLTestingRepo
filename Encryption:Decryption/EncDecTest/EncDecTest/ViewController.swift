//
//  ViewController.swift
//  EncDecTest
//
//  Created by Christopher Myers on 11/11/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let keyFunction = SecureData()
        
        keyFunction.createKeyPair()
        keyFunction.encryptData(stringToEncrypt: "Get Lit Whit...")
        keyFunction.decryptData(messageEncrypted: keyFunction.encToDec!, messageEncryptedSize: keyFunction.encToDecSize!)
        
    }

    


}

