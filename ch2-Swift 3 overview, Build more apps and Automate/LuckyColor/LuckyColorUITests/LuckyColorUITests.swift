//
//  LuckyColorUITests.swift
//  LuckyColorUITests
//
//  Created by jamesshih on 2017/4/14.
//  Copyright © 2017年 i-link. All rights reserved.
//

import XCTest

class LuckyColorUITests: XCTestCase {
        
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
        var bTestResult = true
        
        let my_picker = app.pickers["auto_picker"].pickerWheels.element
        let label_obj = app.staticTexts["auto_label"]
        let expected_vals = ["Apples": "Red", "Oranges": "Orange", "Berries": "Blue", "Grapes": "Green", "Pineapple": "Yellow"]
        
        for (key, value) in expected_vals {
            my_picker.adjust(toPickerWheelValue: String(key))
            
            sleep(2)
            
            let label_text = label_obj.label
            
            if label_text.contains(String(value)) {
                bTestResult = true
            } else {
                bTestResult = false
                break
            }
            XCTAssertTrue(bTestResult)
        }
    }
    
}
















