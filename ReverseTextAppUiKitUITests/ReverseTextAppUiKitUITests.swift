//
//  ReverseTextAppUiKitUITests.swift
//  ReverseTextAppUiKitUITests
//
//  Created by Alex Gav on 08.06.2022.
//

import XCTest
@testable import ReverseTextAppUiKit

final class ReverseTextAppUiKitUITests: XCTestCase {
    private var app = XCUIApplication()
    private lazy var mainTextField = app.textFields["MainTextField"]
    private lazy var customWordsTextField = app.textFields["CustomWordsTextField"]
    private lazy var label = app.staticTexts["Label"]
    private lazy var customTextView = XCUIApplication().otherElements["CustomTextView"]
    
    
    override func setUp() {
        super.setUp()
        let setUpApp = XCUIApplication()
        setUpApp.launch()
    }
    
    func test_DefaultReverseType() throws {
        mainTextField.tap()
        mainTextField.typeText("Hello1")
        app.keyboards.buttons["return"].tap()
        XCTAssertEqual(label.label, "olleH1")
    }
    
    func test_CustomReverseTypeWithoutTextToIgnore() throws {
        mainTextField.tap()
        mainTextField.typeText("Hello1")
        app.keyboards.buttons["return"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Custom"]/*[[".segmentedControls.buttons[\"Custom\"]",".buttons[\"Custom\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(label.label, "1olleH")
        app/*@START_MENU_TOKEN@*/.buttons["Default"]/*[[".segmentedControls.buttons[\"Default\"]",".buttons[\"Default\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func test_CustomReverseTypeWithTextToIgnore() throws {
        mainTextField.tap()
        mainTextField.typeText("Hello1")
        app.keyboards.buttons["return"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Custom"]/*[[".segmentedControls.buttons[\"Custom\"]",".buttons[\"Custom\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        customWordsTextField.tap()
        customWordsTextField.typeText("1")
        XCTAssertEqual(label.label, "olleH1")
    }
    
    func test_CustomViewIsVisible() throws {
        mainTextField.tap()
        mainTextField.typeText("Hello1")
        app.keyboards.buttons["return"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Custom"]/*[[".segmentedControls.buttons[\"Custom\"]",".buttons[\"Custom\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        customWordsTextField.tap()
        customWordsTextField.typeText("1")
        app.keyboards.buttons["return"].tap()
        XCTAssertEqual(true, customTextView.isEnabled)
    }
    
    func test_CustomViewIsHidden() throws {
        mainTextField.tap()
        mainTextField.typeText("Hello1")
        app.keyboards.buttons["return"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Custom"]/*[[".segmentedControls.buttons[\"Custom\"]",".buttons[\"Custom\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        customWordsTextField.tap()
        customWordsTextField.typeText("1")
        app.keyboards.buttons["return"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["Default"]/*[[".segmentedControls.buttons[\"Default\"]",".buttons[\"Default\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(false, customTextView.exists)
    }
}
