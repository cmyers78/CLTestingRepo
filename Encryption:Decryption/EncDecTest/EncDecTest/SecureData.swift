//
//  SecureData.swift
//  EncDecTest
//
//  Created by Christopher Myers on 11/11/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import Foundation


class SecureData : NSObject {
    
    var publicKey : SecKey?
    var privateKey : SecKey?
    
    var encToDec : [UInt8]?
    
    override init() {
        super.init()
        
    }
    
    func createKeyPair() {
        
        var statusCode : OSStatus

        
        let publicKeyAttr : [NSString : AnyObject] = [kSecAttrIsPermanent: true as AnyObject, kSecAttrApplicationTag:"publicTag".data(using: .utf8)! as AnyObject]
        let privateKeyAttr : [NSString : AnyObject] = [kSecAttrIsPermanent: true as AnyObject, kSecAttrApplicationTag:"privateTag".data(using: .utf8)! as AnyObject]
        
        
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
    
    func encryptData(stringToEncrypt : String) {
        
        
        var statusCode : OSStatus
        
        let stringEnc = stringToEncrypt
        
        let stringEncData = [UInt8](stringEnc.utf8)
        
        let stringEncDataLength = UInt(stringEnc.characters.count)
        
        let blockSize = SecKeyGetBlockSize(self.publicKey!)
        
        var messageEncrypted = [UInt8](repeating: 0, count: blockSize)
        
        var messageEncryptedSize = blockSize
        
        var result = SecKeyEncrypt(publicKey!, SecPadding.PKCS1, stringEncData, Int(stringEncDataLength), &messageEncrypted, &messageEncryptedSize)
        
        if result != noErr {
            print("Encryption Error")
        
        } else {
            print("here comes the result...get lit whitney!")
            
            print(messageEncrypted)
            self.encToDec = messageEncrypted
            print(result)
        }
       
    }
    
    func decryptData(intToDecrypt : UInt8) {
        
        
        
    }
    
}
