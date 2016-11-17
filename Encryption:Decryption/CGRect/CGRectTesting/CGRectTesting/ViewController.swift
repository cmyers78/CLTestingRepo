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
        UIView.animate(withDuration: TimeInterval(duration), delay: 0.0, options: .curveLinear, animations: {
            intersectView.frame.origin.x = self.view.frame.size.width
            self.checkForIntersect()
        }, completion: {_ in
            intersectView.frame.origin.x = -intersectView.frame.size.width
            //self.checkForIntersect()
            
            self.animateTheRect(intersectView: intersectView)
        })
    }
    
    func checkForIntersect() {
        if self.intersectFrame?.intersects(self.firstFrame!) == true {
            firstView?.backgroundColor = UIColor.cyan
        } else {
            firstView?.backgroundColor = UIColor.darkGray
        }
        
    }


}

