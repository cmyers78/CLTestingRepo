//
//  ItemsListViewControllerTest.swift
//  ToDo
//
//  Created by Christopher Myers on 4/20/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import XCTest
@testable import ToDo


class ItemsListViewControllerTest: XCTestCase {
    
    var sut : ItemsListViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
        sut = viewController as! ItemsListViewController
        
        _ = sut.view
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_TableViewIsNotNilAfterViewDidLoad() {
        
        
        XCTAssertNotNil(sut.tableView)
        
    }
    
    func test_LoadingView_SetsTableViewDataSource() {
        
        
        XCTAssertTrue(sut.tableView.dataSource is ItemListDataProvider)

    }
    
    func test_LoadingView_SetsTableViewDelegate() {
        XCTAssertTrue(sut.tableView.delegate is ItemListDataProvider)
    }
    
    func test_LoadingView_SetsDataSourceAndDelegateToSameObject() {
        XCTAssertEqual(sut.tableView.dataSource as? ItemListDataProvider, sut.tableView.delegate as? ItemListDataProvider)
    }
}
