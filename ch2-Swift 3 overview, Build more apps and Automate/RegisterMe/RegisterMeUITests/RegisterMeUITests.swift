//
//  RegisterMeUITests.swift
//  RegisterMeUITests
//
//  Created by jamesshih on 2017/4/18.
//  Copyright © 2017年 i-link. All rights reserved.
//

import XCTest

class RegisterMeUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func getTextFromDefaultLabel() -> String {
        let default_label = app.staticTexts["auto_default_label"]
        return default_label.label
    }
    
    func enterName(name: String) {
        
        let nameTextField = app.textFields["auto_name"]
        nameTextField.tap()
        let clearTextButton = nameTextField.buttons["Clear text"]
        let currentValue = nameTextField.value as! String
        
        if !currentValue.isEmpty {
            clearTextButton.tap()
        }
        nameTextField.typeText(name)
        sleep(1)
    }
    
    func enterEmail(email: String) {
        
        let emailTextField = app.textFields["auto_email"]
        emailTextField.tap()
        let clearTextButton = emailTextField.buttons["Clear text"]
        let currentValue = emailTextField.value as! String
        
        if !currentValue.isEmpty {
            clearTextButton.tap()
        }
        emailTextField.typeText(email)
        sleep(1)
    }
    
    func clickSubmitButton() {
        
        let submitBtn = app.buttons["auto_submit"]
        submitBtn.tap()
        sleep(1)
    }
    
    func doesConfirmationLinkExists() -> Bool {
        
        let registrationLink = app.links["Confirm Registration"]
        if registrationLink.exists {
            return true
        } else {
            return false
        }
    }
    
    func clickOnConfirmationLink() {
        app.links["Confirm Registration"].tap()
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
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        
    }
    
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
    
    func testRegisterationFailsForExistingUser() {
        enterName(name: "AutoUser22")
        enterEmail(email: "autouser22@test.com")
        clickSubmitButton()
        
        if doesConfirmationLinkExists() {
            enterName(name: "AutoUser22")
            enterEmail(email: "autouser22@test.com")
            clickSubmitButton()
        }
        
        XCTAssertFalse(doesConfirmationLinkExists())
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

    func testTextFieldForEmailAddress() {
        
        let name = "autouser44"
        let email = "autouser44"
        
        enterName(name: name)
        enterEmail(email: email)
        clickSubmitButton()
        
        let text = getTextFromDefaultLabel()
        XCTAssertTrue(!text.isEmpty)
    }
}


























