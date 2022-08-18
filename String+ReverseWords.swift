//
//  String+ReverseWords.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 15.08.2022.
//

import Foundation


extension String {
    
    func reversedByWords() -> String {
        var word: String = ""
        var reversed: String = ""
        for character in self {
            if character == " " {
                word = String(word.reversed())
                reversed += word
                reversed += " "
                word = ""
            } else {
                word += String(character)
            }
        }
        word = String(word.reversed())
        reversed += word
        return reversed
    }
}
