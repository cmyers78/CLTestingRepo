//
//  SecureData.swift
//  EncDecTest
//
//  Created by Christopher Myers on 11/11/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import Foundation


class SecureData : NSObject {
    
    override init() {
        super.init()
        
    }
    
    func createKeyPair() {
        
        var statusCode : OSStatus
        var publicKey : SecKey?
        var privateKey : SecKey?
        
        let publicKeyAttr : [NSObject : Any] = [kSecAttrIsPermanent: true as NSObject, kSecAttrApplicationTag:"publicTag".data(using: .utf8)! as Any]
        let privateKeyAttr : [NSObject : Any] = [kSecAttrIsPermanent: true as NSObject, kSecAttrApplicationTag:"privateTag".data(using: .utf8)! as Any]
        
        
        var keyPairAttr = [NSObject : NSObject]()
        keyPairAttr[kSecAttrKeyType] = kSecAttrKeyTypeRSA
        keyPairAttr[kSecAttrKeySizeInBits] = 512 as NSObject?
        keyPairAttr[kSecPublicKeyAttrs] = publicKeyAttr as NSObject?
        keyPairAttr[kSecPrivateKeyAttrs] = privateKeyAttr as NSObject?
        
        statusCode = SecKeyGeneratePair(keyPairAttr as CFDictionary, &publicKey, &privateKey)
        
        if statusCode == noErr && publicKey != nil && privateKey != nil {
            print("Key pair generate OK")
            print("Public Key: \(publicKey!)")
            print("Private Key: \(privateKey!)")
            
        } else {
            print("Error generating key pair: \(statusCode)")
        }
    }
    
    
    
}
