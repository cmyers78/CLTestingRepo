//
//  ThirdViewController.swift
//  RealmPlayground
//
//  Created by Christopher Myers on 10/16/17.
//  Copyright © 2017 Dragoman Developers, LLC. All rights reserved.
//

import UIKit
import RealmSwift
class ThirdViewController: UIViewController {

    @IBOutlet weak var thirdVCLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm3 = try! Realm()
        
        let objects = realm3.objects(RealmModel.self)
        
        
        if let modelUpdate = objects.last {
            print(modelUpdate)
            thirdVCLabel.text = String(describing: modelUpdate)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
