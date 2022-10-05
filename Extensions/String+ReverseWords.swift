//
//  String+ReverseWords.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 15.08.2022.
//

import Foundation


extension String {
    
    private func rightReverse(word: String, exception: String) -> String {
        var part: String = ""
        var index: Int = 0
        var newWord: String = ""
        while index <= Int(word.count - exception.count) {
            let start = word.index(word.startIndex, offsetBy: index)
            let end = word.index(word.startIndex, offsetBy: index + Int(exception.count))
            let mySubstring = word[start..<end]
            if mySubstring == exception {
                newWord += String(part.reversed())
                newWord += exception
                index += Int(exception.count)
                part = ""
                continue
            }
            part += String(word[word.index(word.startIndex, offsetBy: index)])
            index += 1
        }
        while index < word.count {
            part += String(word[word.index(word.startIndex, offsetBy: index)])
            index += 1
        }
        newWord += String(part.reversed())
        return newWord
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
                word += subWord
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
