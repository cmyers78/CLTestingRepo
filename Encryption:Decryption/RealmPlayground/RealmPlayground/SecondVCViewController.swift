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
        
        let mod = SecondRealmModel()
        mod.faveFood = "Chicken"
        mod.faveLanguage = "Russian"
        mod.faveTeam = "Bulldogs"
        
        print("updating Realm")
        try! realm2.write {
            if let modelOne = model.last {
                // modelOne.secon = mod
                modelOne.second = SecondRealmModel()
                modelOne.second?.faveFood = "Chicken"
                modelOne.second?.faveTeam = "Georgia"
                
            }
        }


        secondLabel.text = model.last?.name
        // Do any additional setup after loading the view.
    }


    @IBAction func thirdButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "thirdVC") as! ThirdViewController
        present(vc, animated: true, completion: nil)
    }

}
