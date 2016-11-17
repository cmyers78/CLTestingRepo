//
//  ViewController.swift
//  CGRectTesting
//
//  Created by Christopher Myers on 11/17/16.
//  Copyright © 2016 Dragoman Developers, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstView : UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let view = self.view.frame
        
        let firstFrame = CGRect(x: view.origin.x, y: view.origin.y, width: (view.width/2), height: (view.height/2))
        
        self.firstView = UIView(frame: firstFrame)
        firstView?.backgroundColor = UIColor.darkGray
        
        
        self.view.addSubview(firstView!)
        
        let secondFrame = CGRect(x: (firstView?.frame.maxX)!, y: (firstView?.frame.minY)!, width: (view.width/2), height: (view.height/2))
        
        let secondView = UIView(frame: secondFrame)
        secondView.backgroundColor = UIColor.blue
        self.view.addSubview(secondView)
        
        let intersectFrame = CGRect(x: view.origin.x, y: view.origin.y + 25, width: 75, height: 200)
        let intersectView = UIView(frame: intersectFrame)
        intersectView.backgroundColor = UIColor.brown
        self.view.addSubview(intersectView)
        
        self.animateTheRect(intersectView: intersectView)
        
        let testing = firstFrame.intersects(secondFrame)
//        if testing == true {
//            print("These intersect")
//            
//        } else {
//            print("No intersection")
//            let nonintersectFrame = CGRect(x: 110, y: 120, width: 200, height: 400)
//            let nonintersectView = UIView(frame: nonintersectFrame)
//            nonintersectView.backgroundColor = UIColor.yellow
//            self.view.addSubview(nonintersectView)
//        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func animateTheRect(intersectView : UIView) {
        let rectViewSpeed = 18.0/view.frame.size.width
        let duration = (view.frame.size.width - intersectView.frame.origin.x) * rectViewSpeed
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear, animations: {
            
            
            
            
            intersectView.frame.origin.x = self.view.frame.size.width
        }, completion: {_ in
            intersectView.frame.origin.x = -intersectView.frame.size.width
            self.animateTheRect(intersectView: intersectView)
        })
    }


}

