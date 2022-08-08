//
//  ReverseTextAppUiKitUITests.swift
//  ReverseTextAppUiKitUITests
//
//  Created by Alex Gav on 08.06.2022.
//

import XCTest

@testable import ReverseTextAppUiKit

class ReverseTextAppUiKitUITests: XCTestCase {
    
    var sut: ReverseWordsViewController!
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = ReverseWordsViewController()
    }
    
    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func test1() throws {
        /*let yourStoryboard = UIStoryboard(name: "ReverseTextAppUiKit", bundle: nil)
         let yourViewController = yourStoryboard.instantiateViewController(withIdentifier: "ReverseWordsViewController") as! ReverseWordsViewController
         yourViewController.loadView()
         */
        let app = XCUIApplication()
        let enterTextTextField = app.textFields["Enter text:"]
        enterTextTextField.tap()
        let lable = app.staticTexts["Lable"]
        app.textFields.element.typeText("Hello World!")
        XCTAssertEqual(app.buttons.element.title, "Reverse")
        let reverseStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Reverse"]/*[[".buttons[\"Reverse\"].staticTexts[\"Reverse\"]",".staticTexts[\"Reverse\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        reverseStaticText.tap()
        XCTAssertEqual(lable.title, "olleH !dlroW")
        XCTAssertEqual(app.buttons.element.title, "Clear")
        let clearStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Clear"]/*[[".buttons[\"Clear\"].staticTexts[\"Clear\"]",".staticTexts[\"Clear\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        clearStaticText.tap()
        XCTAssertEqual(app.buttons.element.title, "Reverse")
    }
    
    
}
