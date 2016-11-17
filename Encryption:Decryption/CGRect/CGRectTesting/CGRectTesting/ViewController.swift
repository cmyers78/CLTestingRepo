//
//  ViewController.swift
//  CGRectTesting
//
//  Created by Christopher Myers on 11/17/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view.frame
        
        let firstFrame = CGRect(x: view.origin.x, y: view.origin.y, width: (view.width/3), height: (view.height/3))
        
        let firstView = UIView(frame: firstFrame)
        firstView.backgroundColor = UIColor.darkGray
        
        
        self.view.addSubview(firstView)
        
        let secondFrame = CGRect(x: firstView.frame.maxX - 1, y: firstView.frame.minY, width: (view.width/3), height: (view.height/3))
        
        let secondView = UIView(frame: secondFrame)
        secondView.backgroundColor = UIColor.blue
        self.view.addSubview(secondView)
        
        let testing = firstFrame.intersects(secondFrame)
        if testing == true {
            print("These intersect")
            let intersectFrame = CGRect(x: 110, y: 60, width: 200, height: 400)
            let intersectView = UIView(frame: intersectFrame)
            intersectView.backgroundColor = UIColor.brown
            self.view.addSubview(intersectView)
        } else {
            print("No intersection")
            let nonintersectFrame = CGRect(x: 110, y: 120, width: 200, height: 400)
            let nonintersectView = UIView(frame: nonintersectFrame)
            nonintersectView.backgroundColor = UIColor.yellow
            self.view.addSubview(nonintersectView)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

