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
    var encToDecSize : Int?
    
    
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
    
    func encryptData(stringToEncrypt : String)  {
        
        
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
            self.encToDecSize = messageEncryptedSize
            print(result)
        }
    }
    
    func decryptData(messageEncrypted : [UInt8], messageEncryptedSize : Int) {
        
        let intDec = messageEncrypted
        let intDecSize = messageEncryptedSize
        
        
        
        // turn int To Decrypt into data??
        
        var messageDecryptedBlockSize = SecKeyGetBlockSize(self.privateKey!)
        
        var messageDecrypted = [UInt8](repeating: 0, count: messageDecryptedBlockSize)
        
        let result = SecKeyDecrypt(self.privateKey!, SecPadding.PKCS1, intDec, intDecSize, &messageDecrypted, &messageDecryptedBlockSize)
        
        if result != noErr {
            print("Decryption Error")
        } else {
            print(messageDecrypted)
            print(result)
            let decryptedText = String(bytes: messageDecrypted, encoding: .utf8)
            print(decryptedText!)
            
        }
        
        
        
        
    }
    
}
