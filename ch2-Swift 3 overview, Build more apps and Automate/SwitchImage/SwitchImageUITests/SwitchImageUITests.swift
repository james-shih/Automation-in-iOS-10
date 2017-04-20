//
//  SwitchImageUITests.swift
//  SwitchImageUITests
//
//  Created by jamesshih on 2017/4/17.
//  Copyright © 2017年 i-link. All rights reserved.
//

import XCTest

class SwitchImageUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    func getLabelText() -> String {
        let label_text = app.staticTexts["auto_label"]
        return label_text.label
    }
    
    func getDefaultLabelText() -> String {
        let default_label_text = app.staticTexts["auto_default_label"]
        return default_label_text.label
    }
    
    func toggleSwitch() {
        let switch_bar = app.switches["auto_switch"]
        switch_bar.tap()
    }
    
    func isImageDisplayed() -> Bool {
        let display_image = app.images["auto_image"]
        
        if display_image.exists {
            return true
        } else {
            return false
        }
    }
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testLabelUpdateWithSwitchStatusON() {
        XCTAssertTrue(getLabelText().contains("ON"))
    }
    
    func testLabelUpdatedWithSwitchStateOFF() {
        toggleSwitch()
        sleep(1)
        XCTAssertTrue(getLabelText().contains("OFF"))
    }
    
    func testIsImageHiddenWithSwitchStateON() {
        XCTAssertTrue(isImageDisplayed())
    }
    
    func testIsImageHiddenWithSwitchStateOFF() {
        toggleSwitch()
        sleep(1)
        XCTAssertFalse(isImageDisplayed())
    }
    
    func testDefaultLabelDisplayedWithSwitchStateOFF() {
        toggleSwitch()
        sleep(1)
        XCTAssertTrue(getDefaultLabelText().contains("Switch"))
    }
    
    func testToggleSwitchAndValidateDefaultLabel() {
        toggleSwitch()
        sleep(1)
        toggleSwitch()
        sleep(2)
        XCTAssertTrue(getDefaultLabelText().isEmpty)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
