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
    var firstFrame : CGRect?
    var secondView : UIView?
    var secondFrame : CGRect?
    var intersectView : UIView?
    var intersectFrame : CGRect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("View is appearing")
        
        let view = self.view.frame
        
        self.firstFrame = CGRect(x: view.origin.x, y: view.origin.y, width: (view.width/2), height: (view.height/2))
        
        self.firstView = UIView(frame: firstFrame!)
        firstView?.backgroundColor = UIColor.darkGray
        
        
        self.view.addSubview(firstView!)
        
        self.secondFrame = CGRect(x: (firstView?.frame.maxX)!, y: (firstView?.frame.minY)!, width: (view.width/2), height: (view.height/2))
        
        self.secondView = UIView(frame: secondFrame!)
        secondView?.backgroundColor = UIColor.blue
        self.view.addSubview(secondView!)
        
        self.intersectFrame = CGRect(x: view.origin.x, y: view.origin.y + 25, width: 75, height: 200)
        self.intersectView = UIView(frame: intersectFrame!)
        intersectView?.backgroundColor = UIColor.brown
        self.view.addSubview(intersectView!)
        
        self.animateTheRect(intersectView: intersectView!)
        //self.checkForIntersect()
    }



    func animateTheRect(intersectView : UIView) {
        let rectViewSpeed = 18.0/view.frame.size.width
        let duration = (view.frame.size.width - intersectView.frame.origin.x) * rectViewSpeed
        UIView.animate(withDuration: TimeInterval(duration),
                       delay: 0.0,
                       options: .curveLinear,
                       animations: {
                        intersectView.frame.origin.x = self.view.frame.size.width
                        self.checkForIntersect()
                        print(rectViewSpeed)
                        print(duration)
                        //self.checkForIntersectSecondFrame()
                        let data = intersectView.layer.presentation()?.frame
                        print("here comes the data: \(data)")

                    },
                       completion: {_ in
                        intersectView.frame.origin.x = -intersectView.frame.size.width
                        self.firstView?.backgroundColor = UIColor.darkGray
                        self.secondView?.backgroundColor = UIColor.blue
                        self.animateTheRect(intersectView: intersectView)
                    })
    }
    
    func checkForIntersect() {
        var intersectX = Int((self.intersectView?.center.x)!)
        print(intersectX)
        let firstViewX = Int((self.firstView?.center.x)!)
        let data = intersectView?.layer.presentation()?.frame
        print("here comes the data: \(data)")
        
        if intersectX < firstViewX {
            self.firstView?.backgroundColor = UIColor.darkGray
        } else {
            self.firstView?.backgroundColor = UIColor.cyan
        }
        
        print(intersectX)
        print(firstViewX)
        print()
        print()
        
//        while intersectX < firstViewX {
//            firstView?.backgroundColor = UIColor.cyan
//            print("Intersect X value is : \(intersectX)")
//        }
        
//        if intersectX < firstViewX {
//            firstView?.backgroundColor = UIColor.darkGray
//            print(self.intersectView?.bounds.minX as Any)
//        }
    }
//    func checkForIntersectSecondFrame() {
//        if self.intersectFrame?.intersects(self.secondFrame!) == true {
//            secondView?.backgroundColor = UIColor.red
//            firstView?.backgroundColor = UIColor.darkGray
//        }
//        
//    }


}

