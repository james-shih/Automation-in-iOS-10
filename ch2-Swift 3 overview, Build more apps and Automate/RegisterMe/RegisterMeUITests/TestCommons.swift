//
//  TestCommons.swift
//  RegisterMe
//
//  Created by jamesshih on 2017/4/21.
//  Copyright © 2017年 i-link. All rights reserved.
//

import XCTest

class TestCommons: XCTestCase {
        
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
    
}
