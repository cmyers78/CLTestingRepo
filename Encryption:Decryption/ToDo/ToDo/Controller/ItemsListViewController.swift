//
//  ItemsListViewController.swift
//  ToDo
//
//  Created by Christopher Myers on 4/20/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import UIKit

class ItemsListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dataProvider: (UITableViewDataSource & UITableViewDelegate)!
    
    override func viewDidLoad() {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        
        
    }



}
