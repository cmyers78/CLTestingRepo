//
//  ViewController.swift
//  programmaticImages
//
//  Created by Christopher Myers on 7/17/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    
    @IBOutlet weak var roomImageView: UIImageView!
    let objectImage1 = UIImageView()
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("===============")
        print(view.frame)
        let maxX = view.frame.width
        let maxY = view.frame.height
        print("max X: \(maxY), max Y:  \(maxY)")
        
        objectImage1.image = #imageLiteral(resourceName: "rm01ob01")
        
        objectImage1.frame = CGRect(x: maxX * RoomLocation.three.valuePercentage.0, y: maxY * RoomLocation.three.valuePercentage.1, width: view.frame.width * 0.10, height: view.frame.width * 0.10)
        print(objectImage1.frame)
        print("================")
        view.addSubview(objectImage1)
        

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(redrawImage), userInfo: nil, repeats: false)
        Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(redo), userInfo: nil, repeats: false)
    }
    
    func redrawImage() {
        objectImage1.frame = CGRect(x: 50, y: 100, width: view.frame.width * 0.10, height: view.frame.width * 0.10)
    }
    
    func redo() {
        objectImage1.frame = CGRect(x: 200, y: 250, width: view.frame.width * 0.10, height: view.frame.width * 0.10)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

