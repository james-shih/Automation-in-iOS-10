//
//  GroceryListUITests.swift
//  GroceryListUITests
//
//  Created by Alpa Sanghavi on 12/22/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import XCTest

class GroceryListUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func tapOnAddItem() {
        app.tabBars.buttons["Add Item"].tap()
    }
    
    func tapOnGraceryList() {
        app.tabBars.buttons["Grocery List"].tap()
    }
    
    func enterItemName(name: String) {
        let itemLbl = app.textFields["auto_item_name"]
        itemLbl.tap()
        itemLbl.typeText(name)
    }
    
    func enterQuantity(count: String) {
        let qualityLbl = app.textFields["auto_qunatity"]
        qualityLbl.tap()
        qualityLbl.typeText(count)
    }
    
    func seletcPickerValue(item: String) {
        let picker = app.pickers["auto_picker"].pickerWheels.element
        picker.adjust(toPickerWheelValue: item)
    }
    
    func clickAddMeButton() {
        let button = app.buttons["auto_addMe"]
        button.tap()
    }
    
    func addItem(name: String, quality: String, item: String) {
        tapOnAddItem()
        enterItemName(name: name)
        enterQuantity(count: quality)
        seletcPickerValue(item: item)
        clickAddMeButton()
    }
    
    func deleteItem(item: String) {
        app.tables.staticTexts[item].swipeLeft()
        app.buttons["Delete"].tap()
    }
    
    func clickCancelButtonOnAlert() {
        app.alerts["Duplicate Items"].buttons["Cancel"].tap()
    }
    
    func clickContinueButtonOnAlert() {
        app.alerts["Duplicate Items"].buttons["Continue"].tap()
    }
    
    func clickOkOnInvalidItemAlert() {
        app.alerts["Invalid Items"].buttons["OK"].tap()
    }
    
    func gerItemInList() -> Int {
        return Int(app.tables.cells.count)
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

    func testAddNewItem() {
        
    }
    
    func testValidateCancelOnAlertForDuplicateItems() {
        
    }
    
    func testDeleteItem() {
        
    }
    
    func testItemNameAndQualityBothEmpty() {
        
    }
    
    
    
}
