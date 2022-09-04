//
//  ReverseTextAppUiKitTests.swift
//  ReverseTextAppUiKitTests
//
//  Created by Alex Gav on 08.06.2022.
//

import XCTest
@testable import ReverseTextAppUiKit

final class ReverseTextAppUiKitTests: XCTestCase {
    
    func testTwoWords() {
        let inputString = "Hello world!"
        XCTAssertEqual(inputString.reversedByWords(), "olleH dlrow!")
    }
    
    func testReverseSingleLetter() {
        let inputString = "P"
        XCTAssertEqual(inputString.reversedByWords(), "P")
    }
    
    func testThreeWords() {
        let inputString = "abc abc AbC"
        XCTAssertEqual(inputString.reversedByWords(), "cba cba CbA")
    }
    
    func testTwoWordsAndSymbol() {
        let inputString = "Final test !"
        XCTAssertEqual(inputString.reversedByWords(), "laniF tset !")
    }
    
    func testReverseSymbols() {
        let inputString = "24/7 31"
        XCTAssertEqual(inputString.reversedByWords(), "24/7 31")
    }
    
    func testTwoWordsWithNoException() {
        let inputString = "Hello world!"
        XCTAssertEqual(inputString.reversedByWords(exception: ""), "olleH !dlrow")
    }
    
    func testTwoWordsWithException() {
        let inputString = "Hello world!"
        XCTAssertEqual(inputString.reversedByWords(exception: "Hello"), "Hello !dlrow")
    }
    
}
