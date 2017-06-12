//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

protocol Broadcastable {
    func sendToBroadcast(_ broadcast : String)
}

struct Entertainer {
    
    var delegate : Broadcastable?
    
    func introduce() {
        print("We are Desus and Mero")
        delegate?.sendToBroadcast("It's Lit")
    }
}

struct Podcast : Broadcastable {
    
    let entertainers = Entertainer()
    
    func broadcast() {
        print("Sponsored by K2")
    }
    
    func sendToBroadcast(_ broadcast: String) {
        
        entertainers.introduce()
    }
    
    
}