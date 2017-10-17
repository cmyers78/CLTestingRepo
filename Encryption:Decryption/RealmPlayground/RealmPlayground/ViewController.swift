//
//  ViewController.swift
//  RealmPlayground
//
//  Created by Christopher Myers on 3/6/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet weak var labelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let user1 = RealmModel()
        
        user1.name = "Chris"
        user1.age = 38
        user1.state = "North Carolina"
        
        let realm = try! Realm()
        try! realm.write {
            realm.add(user1)

        }
        
        print("Screen One user model : \(user1)")
        
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let controller = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVCViewController
        
        present(controller!, animated: true, completion: nil)
        
    }

}

