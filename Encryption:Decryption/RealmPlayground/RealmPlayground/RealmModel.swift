//
//  RealmModel.swift
//  RealmPlayground
//
//  Created by Christopher Myers on 3/6/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import Foundation
import RealmSwift

class RealmModel : Object {
    
    dynamic var name = String()
    dynamic var age = Int()
    dynamic var state = String()
    
}
