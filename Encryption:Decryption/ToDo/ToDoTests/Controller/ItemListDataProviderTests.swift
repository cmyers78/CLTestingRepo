//
//  ItemListDataProviderTests.swift
//  ToDo
//
//  Created by Christopher Myers on 4/20/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import XCTest
@testable import ToDo

extension ItemListDataProviderTests {
    class MockTableView : UITableView {
        var cellGotDequeued = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellGotDequeued = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}

class ItemListDataProviderTests: XCTestCase {
    
    var sut : ItemListDataProvider!
    var tableView : UITableView!
    var controller : ItemsListViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = ItemListDataProvider()
        sut.itemManager = ItemManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewController(withIdentifier: "ItemListViewController") as! ItemsListViewController
        
        // called to ensure that the tableview is not nil
        _ = controller.view
        
        tableView = controller.tableView
        tableView.dataSource = sut
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_NumberOfSections_IsTwo() {
        
        
        
        let numberOfSections = tableView.numberOfSections
        
        XCTAssertEqual(numberOfSections, 2)
    }
    
    func test_NumberOfRows_InFirstSectionIsToDoCount () {
        
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 1)
        
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 0), 2)
    }
    
    func test_NumberOfRows_InSecondSection_IsToDoneCount() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        sut.itemManager?.add(ToDoItem(title: "Bar"))
        
        
        sut.itemManager?.checkItem(at: 0)
        
        XCTAssertEqual(tableView.numberOfRows(inSection: 1), 1)
        
        sut.itemManager?.checkItem(at: 0)
        tableView.reloadData()
        
       XCTAssertEqual(tableView.numberOfRows(inSection: 1), 2)
        
        
    }
    
    func test_CellForRow_ReturnsItemCell() {
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        tableView.reloadData()
        
        let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        XCTAssertTrue(cell is ItemCell)
    }
    
    func test_CellForRow_DequeuesCellFromTableView() {
        // create a mock of a TableView
        let mockTableView = MockTableView()
        
        // set Data Source from ItemList Data Provider
        mockTableView.dataSource = sut
        // register the cell
        mockTableView.register(ItemCell.self, forCellReuseIdentifier: "ItemCell")
        
        // add item to ItemManager array
        sut.itemManager?.add(ToDoItem(title: "Foo"))
        mockTableView.reloadData()
        
        // locate data from specific row and section
        _ = mockTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        // check to see if dequeueCell was called is true
        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
}
