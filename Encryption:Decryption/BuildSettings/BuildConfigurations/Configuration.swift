//
//  Configuration.swift
//  BuildConfigurations
//
//  Created by Christopher Myers on 1/3/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import Foundation
import UIKit

enum Environment : String {
    case Staging = "staging"
    case Production = "production"
    case QA = "qa"
    
    
    var baseURL : String {
        switch self {
        case .Staging : return "https://staging-api.myservice.com"
        case .Production : return "https://api.myservice.com"
        case .QA : return "https://www.google.com"
            
        }
    }
    
    var token : String {
        switch self {
        case .Staging : return "12345"
        case .Production : return "56789"
        case .QA : return "0129384756"
            
        }
    }
}

//struct Configuration {
//    lazy var environment : Environment = {
//        
//        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configurations") as? String {
//            print(configuration.rangeOfString("Staging"))
//            
//        }
//        
//        
//            return Environment.Production
//    }()
//    
//}

struct Configuration {
    lazy var environment: Environment = {
        if let configuration = Bundle.main.object(forInfoDictionaryKey: "Configuration") as? String {
            if configuration.range(of: "Staging") != nil {
                return Environment.Staging
            }
            else if configuration.range(of: "QA") != nil {
                return Environment.QA
            }
        }
        
        return Environment.Production
    }()
}
