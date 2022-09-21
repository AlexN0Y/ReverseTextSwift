//
//  String+ReverseWords.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 15.08.2022.
//

import Foundation


extension String {
    
    private func rightReverse(word: String, exception: String) -> String {
        var tempPart: String = ""
        var i: Int = 0
        var tempWord: String = ""
        while i <= Int(word.count - exception.count) {
            let start = word.index(word.startIndex, offsetBy: i)
            let end = word.index(word.startIndex, offsetBy: i + Int(exception.count))
            let mySubstring = word[start..<end]
            if mySubstring == exception {
                tempWord += String(tempPart.reversed())
                tempWord += exception
                i += Int(exception.count)
                tempPart = ""
                continue
            }
            tempPart += String(word[word.index(word.startIndex, offsetBy: i)])
            i+=1
        }
        while i < word.count {
            tempPart += String(word[word.index(word.startIndex, offsetBy: i)])
            i+=1
        }
        tempWord += String(tempPart.reversed())
        return tempWord
    }
    
    func reversedByWords(exception: String) -> String {
        var word: String = ""
        var reversed: String = ""
        for character in self {
            if character == " " && exception != "" && word.contains(exception) {
                let tempWord: String = rightReverse(word: word, exception: exception)
                reversed += tempWord
                reversed += " "
                word = ""
            } else if character == " " && !(exception != "" && word.contains(exception)) {
                word = String(word.reversed())
                reversed += word
                reversed += " "
                word = ""
            } else if character != " " {
                word += String(character)
            }
        }
        if exception != "" && word.contains(exception) {
            let tempWord: String = rightReverse(word: word, exception: exception)
            reversed += tempWord
        } else {
            word = String(word.reversed())
            reversed += word
        }
        return reversed
    }
    
    func reverseLettersOnly() -> String {
        var word: String = ""
        var subWord: String = ""
        var reversed: String = ""
        for character in self {
            if character == " " {
                subWord = String(subWord.reversed())
                word+=subWord
                reversed += word
                reversed += " "
                word = ""
                subWord = ""
            } else if character.isLetter == false {
                word += String(subWord.reversed())
                subWord = ""
                word += String(character)
            }
            else {
                subWord += String(character)
            }
        }
        word += String(subWord.reversed())
        reversed += word
        return reversed
    }
}
