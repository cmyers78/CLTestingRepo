//
//  Secure.swift
//  Symmetric Key Generator
//
//  Created by Christopher Myers on 11/23/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import CryptoSwift


class Secure: NSObject {
    
    var encArray : [UInt8]?
    var decArray : [UInt8]?
    var decString : String?
    
    override init() {
        super.init()
    }
    
    func generateKeyIV() {
        
    }

    func secureEncrypt(stringToEncrypt : String) -> [UInt8] {
        do {
            let aes = try AES(key: "passwordpassword", iv: "drowssapdrowssap")
            let ciperText = try aes.encrypt(stringToEncrypt.utf8.map({$0}))
            self.encArray = ciperText
            
            
            print(ciperText)
//            print(decrypted)
//            let result = String(bytes: decrypted, encoding: .utf8)
            //print(result ?? String())
            
        } catch {
            print("encryption with CryptoSwift failed")
            
        }
        
        return self.encArray!
    }
    
    func secureDecrypt(cipherToDecrypt : [UInt8]) -> String {
        do {
            let aes = try AES(key: "passwordpassword", iv: "drowssapdrowssap")
            self.decArray = try aes.decrypt(cipherToDecrypt)
            
            self.decString = String(bytes: self.decArray!, encoding: .utf8)
            print(self.decString ?? "Couldn't decrypt to String")
            
        } catch {
            print("decryption with CryptoSwift failed")
        }
        return self.decString!
    }
}
