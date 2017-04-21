//
//  RegisterMePositiveTests.swift
//  RegisterMe
//
//  Created by jamesshih on 2017/4/21.
//  Copyright © 2017年 i-link. All rights reserved.
//

import XCTest

class RegisterMePositiveTests: TestCommons {
    
    func testRegistationPassesForNewUserWithValidNameAndEmail() {
        enterName(name: "AutoUser11")
        enterEmail(email: "autouser11@test.com")
        clickSubmitButton()
        sleep(1)
        
        if doesConfirmationLinkExists() {
            clickOnConfirmationLink()
        }
        
        XCTAssertTrue(doesConfirmationLinkExists())
    }
    
    func testRetrySuccessfulWithNewEmail() {
        enterName(name: "")
        enterEmail(email: "autouser88@test.com")
        clickSubmitButton()
        
        if !getTextFromDefaultLabel().isEmpty {
            enterName(name: "Autouser88")
            enterEmail(email: "autouser88@test.com")
            clickSubmitButton()
        }
        
        XCTAssertTrue(doesConfirmationLinkExists())
    }
    
    func testRetrySuccessfulWithNewName() {
        enterName(name: "Autouser99")
        enterEmail(email: "")
        clickSubmitButton()
        
        if !getTextFromDefaultLabel().isEmpty {
            enterName(name: "Autouser99")
            enterEmail(email: "autouser99@test.com")
            clickSubmitButton()
        }
        
        XCTAssertTrue(doesConfirmationLinkExists())
    }
    
    func testTextFieldForNameStartingWithSpace() {
        
        let name = " autouser10"
        let email = "autouser10@test.com"
        
        enterName(name: name)
        enterEmail(email: email)
        clickSubmitButton()
        
        let text = getTextFromDefaultLabel()
        XCTAssertTrue(text.isEmpty)
    }
    
    func testTextFieldForNameEndWithSpace() {
        
        let name = "autouser10 "
        let email = "autouser10@test.com"
        
        enterName(name: name)
        enterEmail(email: email)
        clickSubmitButton()
        
        let text = getTextFromDefaultLabel()
        XCTAssertTrue(text.isEmpty)
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
