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
    private lazy var enterTextTextField = app.textFields["Enter text:"]
    private lazy var label = app.staticTexts["Label"]
    private lazy var reverseStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Reverse"]/*[[".buttons[\"Reverse\"].staticTexts[\"Reverse\"]",".staticTexts[\"Reverse\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    private lazy var clearStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Clear"]/*[[".buttons[\"Clear\"].staticTexts[\"Clear\"]",".staticTexts[\"Clear\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    
    override func setUp() {
        super.setUp()
        let setUpApp = XCUIApplication()
        setUpApp.launch()
    }
    
    func test_reverseButton_CurrentLabelNameOnFirstInput() throws {
        app.launch()
        enterTextTextField.tap()
        app.textFields.element.typeText("Hello World!")
        app.keyboards.buttons["return"].tap()
        XCTAssertEqual(app.buttons.element.label, "Reverse")
    }
    
    func test_reverseButton_becomeClearOnReversingInput() throws {
        app.launch()
        enterTextTextField.tap()
        app.textFields.element.typeText("Hello World!")
        app.keyboards.buttons["return"].tap()
        reverseStaticText.tap()
        XCTAssertEqual(label.label, "olleH !dlroW")
        XCTAssertEqual(app.buttons.element.label, "Clear")
    }
    
    func test_reverseButton_becomeReverseOnClearingInput() throws {
        app.launch()
        enterTextTextField.tap()
        app.textFields.element.typeText("Hello World!")
        app.keyboards.buttons["return"].tap()
        reverseStaticText.tap()
        XCTAssertEqual(label.label, "olleH !dlroW")
        clearStaticText.tap()
        XCTAssertEqual(app.buttons.element.label, "Reverse")
    }
    func test_reverseButton_DisabledWithEmptyInput() throws {
        app.launch()
        enterTextTextField.tap()
        app.textFields.element.typeText("Hello World!")
        app.keyboards.buttons["return"].tap()
        reverseStaticText.tap()
        XCTAssertEqual(label.label, "olleH !dlroW")
        clearStaticText.tap()
        XCTAssertEqual(app.buttons.element.isEnabled, false)
    }
}
