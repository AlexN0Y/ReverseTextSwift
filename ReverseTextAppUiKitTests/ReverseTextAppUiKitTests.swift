//
//  ReverseTextAppUiKitTests.swift
//  ReverseTextAppUiKitTests
//
//  Created by Alex Gav on 08.06.2022.
//

import XCTest
@testable import ReverseTextAppUiKit

final class ReverseTextAppUiKitTests: XCTestCase {
    
    func testTwoWords(){
        let s = "Hello world!"
        XCTAssertEqual(s.reverseWords(), "olleH !dlrow")
    }
    
    func testOneLetter(){
        let s = "P"
        XCTAssertEqual(s.reverseWords(), "P")
    }
    
    func testThreeWords(){
        let s = "abc abc AbC"
        XCTAssertEqual(s.reverseWords(), "cba cba CbA")
    }
    
    func testTwoWordsAndSymbol(){
        let s = "Final test !"
        XCTAssertEqual(s.reverseWords(), "laniF tset !")
    }
    
}
