//
//  ReverseTextAppUiKitUITests.swift
//  ReverseTextAppUiKitUITests
//
//  Created by Alex Gav on 08.06.2022.
//

import XCTest

@testable import ReverseTextAppUiKit

class ReverseTextAppUiKitUITests: XCTestCase {
    
    override func setUpWithError() throws {
        try super.setUpWithError()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test1() throws {
        let app = XCUIApplication()
        let enterTextTextField = app.textFields["Enter text:"]
        enterTextTextField.tap()
        let lable = app.staticTexts["Lable"]
        app.textFields.element.typeText("Hello World!")
        app.keyboards.buttons["return"].tap()
        XCTAssertEqual(app.buttons.element.label, "Reverse")
        let reverseStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Reverse"]/*[[".buttons[\"Reverse\"].staticTexts[\"Reverse\"]",".staticTexts[\"Reverse\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        reverseStaticText.tap()
        XCTAssertEqual(lable.label, "olleH !dlroW")
        XCTAssertEqual(app.buttons.element.label, "Clear")
        let clearStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Clear"]/*[[".buttons[\"Clear\"].staticTexts[\"Clear\"]",".staticTexts[\"Clear\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        clearStaticText.tap()
        XCTAssertEqual(app.buttons.element.label, "Reverse")
    }
    
    
}
