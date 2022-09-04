//
//  String+ReverseWords.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 15.08.2022.
//

import Foundation


extension String {
    
    func reversedByWords(exception: String) -> String {
        var word: String = ""
        var reversed: String = ""
        for character in self {
            if character == " " {
                if(exception != "" && word.contains(exception)){
                    var exceptionIndex: Int = 0
                    for i in 0...(word.count - exception.count){
                        let start = word.index(word.startIndex, offsetBy: i)
                        let end = word.index(word.startIndex, offsetBy: Int(word.count - exception.count) + 1)
                        let mySubstring = word[start..<end]
                        if mySubstring == exception {
                            exceptionIndex = Int(i)
                            break
                        }
                    }
                    var start = word.startIndex
                    var end = word.index(word.startIndex, offsetBy: exceptionIndex)
                    var tempBeforeExceptionStr = String(word[start..<end])
                    start = word.index(word.startIndex, offsetBy: (exceptionIndex + exception.count))
                    end = word.endIndex
                    var tempAfterExceptionStr = String(word[start..<end])
                    tempBeforeExceptionStr = String(tempBeforeExceptionStr.reversed())
                    tempAfterExceptionStr = String(tempAfterExceptionStr.reversed())
                    word = tempBeforeExceptionStr + exception + tempAfterExceptionStr
                    reversed += word
                    reversed += " "
                    word = ""
                } else{
                    word = String(word.reversed())
                    reversed += word
                    reversed += " "
                    word = ""
                }
            } else {
                word += String(character)
            }
        }
        if(exception != "" && word.contains(exception)){
            var exceptionIndex: Int = 0
            for i in 0...(word.count - exception.count){
                let start = word.index(word.startIndex, offsetBy: i)
                let end = word.index(word.startIndex, offsetBy: Int(word.count - exception.count) + 1)
                let mySubstring = word[start..<end]
                if mySubstring == exception {
                    exceptionIndex = Int(i)
                    break
                }
            }
            var start = word.startIndex
            var end = word.index(word.startIndex, offsetBy: exceptionIndex)
            var tempBeforeExceptionStr = String(word[start..<end])
            start = word.index(word.startIndex, offsetBy: (exceptionIndex + exception.count))
            end = word.endIndex
            var tempAfterExceptionStr = String(word[start..<end])
            tempBeforeExceptionStr = String(tempBeforeExceptionStr.reversed())
            tempAfterExceptionStr = String(tempAfterExceptionStr.reversed())
            word = tempBeforeExceptionStr + exception + tempAfterExceptionStr
            reversed += word
        } else{
            word = String(word.reversed())
            reversed += word
        }
        return reversed
    }
    
    func reversedByWords() -> String {
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
