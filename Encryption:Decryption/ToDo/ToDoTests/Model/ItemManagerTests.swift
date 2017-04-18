//
//  ItemManagerTests.swift
//  ToDo
//
//  Created by Christopher Myers on 4/18/17.
//  Copyright © 2017 Dragoman Developers. All rights reserved.
//

import XCTest
@testable import ToDo

class ItemManagerTests: XCTestCase {
    var sut : ItemManager!
    
    override func setUp() {
        super.setUp()
        sut = ItemManager()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_ToDoCount_Initially_isZero() {
        
        
        XCTAssertEqual(sut.toDoCount, 0)
        
    }
    
    func test_DoneCount_Initially_isZero() {
        
        XCTAssertEqual(sut.doneCount, 0)
    }
    
    func test_addItem_IncreasesToDoCountToOne() {
        sut.addItem(ToDoItem(title: ""))
        
        XCTAssertEqual(sut.toDoCount, 1)
    }
    
    func test_itemAt_AfterAddingAnItem_ReturnsThatItem() {
        
        let item = ToDoItem(title: "Foo")
        sut.addItem(item)
        
        let returnedItem = sut.item(at: 0)
        
        XCTAssertEqual(returnedItem.title, item.title)
    }
    
    
}
