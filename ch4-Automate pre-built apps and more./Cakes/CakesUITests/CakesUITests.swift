//
//  CakesUITests.swift
//  CakesUITests
//
//  Created by Alpa Sanghavi on 12/20/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import XCTest

class CakesUITests: XCTestCase {
    
    let app = XCUIApplication()
    let item_choclate = "Choclate Cake"
    let item_vanilla = "Vanilla Cake"
    let item_darkForest = "DarkForest Cake"
    let item_redVelvet = "Red Velvet Cake"
    let item_strawberry = "Strawberry Cake"
    
    func getScreenContents(itemName: String) -> String {
        
        var contents = ""
        app.tables.staticTexts[itemName].tap()
        app.navigationBars.buttons["More Cakes"].tap()
        contents = app.debugDescription
        
        return contents
    }
    
    func matches(for pattern: String, in source: String) -> [String] {
        
        do {
            let regex = try NSRegularExpression(pattern: pattern)
            let nsString = source as NSString
            let results = regex.matches(in: source, range: NSRange(location: 0, length: nsString.length))
            return results.map { nsString.substring(with: $0.range)}
        } catch let error {
            print("invalid regex: \(error.localizedDescription)")
            return []
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
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testChoclateCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: Choclate Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for Choclate cake is displayed on the screen
         */
        
        let dump = getScreenContents(itemName: item_choclate)
        let patternName = item_choclate
        let patternImage = "Image.*"
        let patternReceipe = "In a bowl.*"
        
        let resultName = matches(for: patternName, in: dump)
        print(resultName)
        
        let resultImage = matches(for: patternImage, in: dump)
        print(resultImage)
        
        let resultReceipe = matches(for: patternReceipe, in: dump)
        print(resultReceipe)
        
        XCTAssertFalse(resultName.isEmpty && resultImage.isEmpty && resultReceipe.isEmpty)
    }
    
    func testVanillaCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: Vanilla Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for Vanilla cake is displayed on the screen
         */
        
        let dump = getScreenContents(itemName: item_vanilla)
        let patternName = item_vanilla
        let patternImage = "Image.*"
        let patternReceipe = "Preheat oven to.*"
        
        let resultName = matches(for: patternName, in: dump)
        print(resultName)
        
        let resultImage = matches(for: patternImage, in: dump)
        print(resultImage)
        
        let resultReceipe = matches(for: patternReceipe, in: dump)
        print(resultReceipe)
        
        XCTAssertFalse(resultName.isEmpty && resultImage.isEmpty && resultReceipe.isEmpty)

    }
    
    func testDarkForestCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: DarkForest Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for DarkForest cake is displayed on the screen
         */
        
        let dump = getScreenContents(itemName: item_darkForest)
        let patternName = item_darkForest
        let patternImage = "Image.*"
        let patternReceipe = "In a large bowl.*"
        
        let resultName = matches(for: patternName, in: dump)
        print(resultName)
        
        let resultImage = matches(for: patternImage, in: dump)
        print(resultImage)
        
        let resultReceipe = matches(for: patternReceipe, in: dump)
        print(resultReceipe)
        
        XCTAssertFalse(resultName.isEmpty && resultImage.isEmpty && resultReceipe.isEmpty)
    }
    
    func testRedVelvetCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: RedVelvet Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for RedVelvet cake is displayed on the screen
         */
        
        let dump = getScreenContents(itemName: item_redVelvet)
        let patternName = item_redVelvet
        let patternImage = "Image.*"
        let patternReceipe = "Beat butter and.*"
        
        let resultName = matches(for: patternName, in: dump)
        print(resultName)
        
        let resultImage = matches(for: patternImage, in: dump)
        print(resultImage)
        
        let resultReceipe = matches(for: patternReceipe, in: dump)
        print(resultReceipe)
        
        XCTAssertFalse(resultName.isEmpty && resultImage.isEmpty && resultReceipe.isEmpty)
    }
    
    func testStrawberryCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: Strawberry Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for Strawberry cake is displayed on the screen
         */
        
        let dump = getScreenContents(itemName: item_strawberry)
        let patternName = item_strawberry
        let patternImage = "Image.*"
        let patternReceipe = "In a large bowl, cream.*"
        
        let resultName = matches(for: patternName, in: dump)
        print(resultName)
        
        let resultImage = matches(for: patternImage, in: dump)
        print(resultImage)
        
        let resultReceipe = matches(for: patternReceipe, in: dump)
        print(resultReceipe)
        
        XCTAssertFalse(resultName.isEmpty && resultImage.isEmpty && resultReceipe.isEmpty)
    }

    
}
