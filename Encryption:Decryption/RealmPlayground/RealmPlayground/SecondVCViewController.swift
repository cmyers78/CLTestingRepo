//
//  SecondVCViewController.swift
//  RealmPlayground
//
//  Created by Christopher Myers on 3/6/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import RealmSwift

class SecondVCViewController: UIViewController {

    @IBOutlet weak var secondLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let realm2 = try! Realm()
        
        let model = realm2.objects(RealmModel.self)
        print("First object")
        print(model.first?.name ?? "Undefined")
        print(model.first?.age ?? 0)
        print(model.first?.state ?? "Not given")
        print(model.last?.state ?? "Not Given")
        
        print("updating Realm")
        try! realm2.write {
            model.first?.state = "Georgia"
            model.last?.state = "Argentina"
        }
        
        print("Last object")
        print(model.last?.name ?? "Undefined")
        print(model.last?.age ?? 0)
        
        print("Updated Realm")
        print(model.first?.state ?? "None Given")
        print(model.last?.state ?? "None Given")
    
        secondLabel.text = model.last?.name
        // Do any additional setup after loading the view.
    }



}
