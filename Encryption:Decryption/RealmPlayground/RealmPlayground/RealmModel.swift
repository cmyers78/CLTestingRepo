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
    
    @objc dynamic var name = String()
    @objc dynamic var age = Int()
    @objc dynamic var state = String()
    @objc dynamic var second : SecondRealmModel? = nil
    
}
