//
//  ReverseTextAppUiKitTests.swift
//  ReverseTextAppUiKitTests
//
//  Created by Alex Gav on 08.06.2022.
//

import XCTest
@testable import ReverseTextAppUiKit

class ReverseTextAppUiKitTests: XCTestCase {
    
    func reverseTEST(){
        let x = ReverseWordsViewController()
        let s = "Hello world!"
        XCTAssertEqual(x.reverseText(s), "olleH !dlrow")
    }
    
    func reverseTEST1(){
        let x = ReverseWordsViewController()
        let s = "P"
        XCTAssertEqual(x.reverseText(s), "P")
    }
    
    func reverseTEST2(){
        let x = ReverseWordsViewController()
        let s = "abc abc AbC"
        XCTAssertEqual(x.reverseText(s), "cba cba CbA")
    }
    
    func reverseTEST3(){
        let x = ReverseWordsViewController()
        let s = "God Ding"
        XCTAssertEqual(x.reverseText(s), "doG gniD")
    }
    
    func reverseTEST4(){
        let x = ReverseWordsViewController()
        let s = ""
        XCTAssertEqual(x.reverseText(s), "")
    }
    
    func reverseTEST5(){
        let x = ReverseWordsViewController()
        let s = "Final test !"
        XCTAssertEqual(x.reverseText(s), "laniF tset !")
    }
    
}
