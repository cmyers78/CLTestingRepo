//
//  SecondRealmModel.swift
//  RealmPlayground
//
//  Created by Christopher Myers on 10/13/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import Foundation
import RealmSwift

class SecondRealmModel : Object {
    
    @objc dynamic var faveTeam = String()
    @objc dynamic var faveFood = String()
    @objc dynamic var faveLanguage = String()
    
    
}
