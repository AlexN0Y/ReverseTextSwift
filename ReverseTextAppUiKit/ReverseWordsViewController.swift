//
//  ViewController.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 08.06.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var reverseButtonOutlet: UIButton!
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var reversedTextLable: UILabel!
    
    @IBAction private func ReverseButton(_ sender: UIButton) {
        guard let textFieldText = mainTextField.text else {
            return
        }
        if reverseButtonOutlet.titleLabel?.text == "Reverse" {
            reversedTextLable.text = reverseText(textFieldText)
            reverseButtonOutlet.setTitle("Clear", for: .normal)
        } else {
            mainTextField.text = ""
            reversedTextLable.text = ""
            reverseButtonOutlet.isEnabled = false
            reverseButtonOutlet.setTitle("Reverse", for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseButtonOutlet.isEnabled = false
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    internal func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard textField.text != nil else {
            reverseButtonOutlet.isEnabled = false
            return false
        }
        reverseButtonOutlet.isEnabled = true
        return true
    }
    
    private func reverseText(_ text: String = "") -> String{
        var word: String = ""
        var reversed: String = ""
        for character in text {
            if character == " " {
                word = String(word.reversed())
                reversed += word
                reversed += " "
                word = ""
            } else{
                word += String(character)
            }
        }
        
        word = String(word.reversed())
        reversed += word
        return reversed
    }
    
}

