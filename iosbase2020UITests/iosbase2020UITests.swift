//
//  iosbase2020UITests.swift
//  iosbase2020UITests
//
//  Created by Robert Polovitzer on 2020-08-30.
//  Copyright © 2020 Robert Polovitzer. All rights reserved.
//

import XCTest

class iosbase2020UITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        self.continueAfterFailure = false
        self.app = XCUIApplication()
        self.app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSelection() {
        sleep(1)
        self.selectFirstCell(identifier: "FactoryCell")
        self.app.swipeUp()
    }
    
    func selectFirstCell(identifier: String) {
        let cell = self.app.cells.element(boundBy: 0)
        cell.tap()
    }
}
