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
        
        // instance of SecureData Class
        let kingInTheNorth = SecureData()
        
        kingInTheNorth.createKeyPair()
        let answer = kingInTheNorth.encryptData(stringToEncrypt: "Winter is coming...")
        kingInTheNorth.decryptData(messageEncrypted: answer.0, messageEncryptedSize: answer.1)
    }
}

