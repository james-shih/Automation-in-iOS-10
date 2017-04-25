//
//  Motivational_QuotesUITests.swift
//  Motivational QuotesUITests
//
//  Created by Alpa Sanghavi on 12/22/16.
//  Copyright © 2016 Alpa Sanghavi. All rights reserved.
//

import XCTest

let quote1 : String = "You Become What You Think The Most.."
let quote2 : String = "Be The Change You Want To Bring.."
let quote3 : String = "Peace & Happiness Lies Within.."
let quote4 : String = "Make Your Dreams Bigger Than Your Fears.."
let quote5 : String = "You Are The Creator Of Your Own Destiny.."
let quote6 : String = "Focus on your Present & Your Future Will Smile"

var quotes_list = [quote1,quote2,quote3,quote4,quote5,quote6]

class Motivational_QuotesUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    func swipePage(pageName: String) {
        app.staticTexts[pageName].swipeLeft()
    }
    
    func gotoPage(pageNumber: Int) {
        
        var i = 1;
        while i < pageNumber {
            let quote = quotes_list[i - 1]
            swipePage(pageName: quote)
            i = i + 1
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
    
    //make sure quote1 is displayed on the screen
    func testValidatePage1()
    {
        XCTAssertTrue(app.staticTexts[quote1].exists)
    }
    
    //swipe on page1 and then make sure page2 with quote2 is displayed on the screen
    func testValidatePage2()
    {
        gotoPage(pageNumber: 2)
        XCTAssertTrue(app.staticTexts[quote2].exists)
    }
    
    //swipe on page1, page2 and then make sure page3 with quote3 is displayed on the screen
    func testValidatePage3()
    {
        gotoPage(pageNumber: 3)
        XCTAssertTrue(app.staticTexts[quote3].exists)
    }
    
    //swipe on page1, page2, page3 and then make sure page4 with quote4 is displayed on the screen
    func testValidatePage4()
    {
        gotoPage(pageNumber: 4)
        XCTAssertTrue(app.staticTexts[quote4].exists)
    }
    
    //swipe on pages 1, 2,3,4 and then make sure page5 with quote5 is displayed on the screen
    func testValidatePage5()
    {
        gotoPage(pageNumber: 5)
        XCTAssertTrue(app.staticTexts[quote5].exists)
    }
    
    //swipe on pages 1, 2,3,4 ,5and then make sure page6 with quote6 is displayed on the screen
    func testValidatePage6()
    {
        gotoPage(pageNumber: 6)
        XCTAssertTrue(app.staticTexts[quote6].exists)
    }
}
