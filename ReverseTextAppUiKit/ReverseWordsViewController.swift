//
//  ViewController.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 08.06.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var reverseButtonOutlet: UIButton!
    @IBOutlet private weak var mainTextField: UITextField!
    @IBOutlet private weak var reversedTextLable: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseButtonOutlet.isEnabled = false
    }
    
    
    @IBAction func TextFieldActions() {
        guard mainTextField.text != "" else {
            if reversedTextLable.text != nil {
                reverseButtonOutlet.setTitle("Clear", for: .normal)
            } else {
                reverseButtonOutlet.isEnabled = false
            }
            return
        }
        reverseButtonOutlet.setTitle("Reverse", for: .normal)
    }
    
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
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        reverseButtonOutlet.isEnabled = textField.text != nil
        return true
    }
    
    private func reverseText(_ text: String = "") -> String {
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

