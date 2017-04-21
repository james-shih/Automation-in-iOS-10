//
//  RegisterMeNegativeTests.swift
//  RegisterMe
//
//  Created by jamesshih on 2017/4/21.
//  Copyright © 2017年 i-link. All rights reserved.
//

import XCTest

class RegisterMeNegativeTests: TestCommons {
        
    func testTextFieldForNameWithAnEmptyString() {
        enterName(name: "")
        enterEmail(email: "auto@test.com")
        clickSubmitButton()
        
        XCTAssertTrue(!getTextFromDefaultLabel().isEmpty)
    }
    
    func testTextFieldForEmailWithAnEmptyString() {
        enterName(name: "AutoUser10")
        enterEmail(email: "")
        clickSubmitButton()
        
        XCTAssertTrue(!getTextFromDefaultLabel().isEmpty)
    }
    
    func testTextFieldsEmailAndNameBothEmpty() {
        enterName(name: "")
        enterEmail(email: "")
        clickSubmitButton()
        
        XCTAssertTrue(!getTextFromDefaultLabel().isEmpty)
    }
    
    func testTextFidldForNameStartingWithNumber() {
        
        let name = "3autouser"
        let email = "3autouser@test.com"
        enterName(name: name)
        enterEmail(email: email)
        clickSubmitButton()
        
        let text = getTextFromDefaultLabel()
        XCTAssertTrue(!text.isEmpty)
    }
    
    func testTextFieldForNameStartingWithSpecialCharacter() {
        
        let name = "$autouser10"
        let email = "autouser10@test.com"
        
        enterName(name: name)
        enterEmail(email: email)
        clickSubmitButton()
        
        let text = getTextFromDefaultLabel()
        XCTAssertTrue(!text.isEmpty)
    }
    
    func testTextFieldForEmailAddress() {
        
        let name = "autouser44"
        let email = "autouser44"
        
        enterName(name: name)
        enterEmail(email: email)
        clickSubmitButton()
        
        let text = getTextFromDefaultLabel()
        XCTAssertTrue(!text.isEmpty)
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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
}
