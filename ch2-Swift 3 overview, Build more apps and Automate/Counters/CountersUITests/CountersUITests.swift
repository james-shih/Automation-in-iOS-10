//
//  CountersUITests.swift
//  CountersUITests
//
//  Created by Alpa Sanghavi on 10/18/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import XCTest

class CountersUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let button_tapMe = app.buttons["tapMe"]
        
        for _ in 1...10 {
            button_tapMe.tap()
        }
        
        let my_label = app.staticTexts["auto_label"]
        let label_text = my_label.label
        let exp_counter = 10
        
        if label_text.contains(String(exp_counter)) {
            print("👌 Test Pased .. Counter value found")
        } else {
            print("🚩 Test Failed ... Counter value not found")
        }
        
        sleep(5)
        
    }
    
}

















