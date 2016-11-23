//
//  ViewController.swift
//  Symmetric Key Generator
//
//  Created by Christopher Myers on 11/22/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import CryptoSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let text = "The forebearing use of power does not only form a touchstone but the manner in which a gentleman has advantages over others is the test of a true gentleman."
        
        do {
            let aes = try AES(key: "passwordpassword", iv: "drowssapdrowssap")
            let ciperText = try aes.encrypt(text.utf8.map({$0}))
            let decrypted = try aes.decrypt(ciperText)
            
            
            print(ciperText)
            print(decrypted)
            let result = String(bytes: decrypted, encoding: .utf8)
            print(result ?? String())
            
        } catch {
            print("encryption with CryptoSwift failed")
            
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }



}

