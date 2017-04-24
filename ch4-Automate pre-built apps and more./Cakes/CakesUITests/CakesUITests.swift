//
//  CakesUITests.swift
//  CakesUITests
//
//  Created by Alpa Sanghavi on 12/20/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import XCTest

class CakesUITests: XCTestCase {
        
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
        
    }
    
    func testVanillaCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: Vanilla Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for Vanilla cake is displayed on the screen
         */
    }
    
    func testDarkForestCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: DarkForest Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for DarkForest cake is displayed on the screen
         */
    }
    
    func testRedVelvetCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: RedVelvet Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for RedVelvet cake is displayed on the screen
         */
    }
    
    func testStrawberryCakeScreen() {
        /*
         In this test we need to verity 3 things
         1. Name: Strawberry Cake is displayed on the screen
         2. Image: Image is visible on the screen
         3. Receipe: Receipe for Strawberry cake is displayed on the screen
         */
    }

    
}
