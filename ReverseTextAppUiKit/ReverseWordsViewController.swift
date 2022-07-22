//
//  ViewController.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 08.06.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var reverseButton: UIButton!
    @IBOutlet private weak var mainTextField: UITextField!
    @IBOutlet private weak var Lable: UILabel!
    @IBOutlet private weak var separator: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reverseButton.isEnabled = false
    }
    
    
    @IBAction func textFieldChanged() {
        if mainTextField.text?.isEmpty == true {
            separator.backgroundColor = UIColor.lightGray
            reverseButton.isEnabled = false
        } else {
            separator.backgroundColor = UIColor.systemBlue
            reverseButton.setTitle("Reverse", for: .normal)
        }
        
    }
    
    
    @IBAction func reverseButtonTapped() {
        separator.backgroundColor = UIColor.lightGray
        guard let textFieldText = mainTextField.text else {
            return
        }
        if reverseButton.titleLabel?.text == "Reverse" {
            Lable.text = reverseText(textFieldText)
            reverseButton.setTitle("Clear", for: .normal)
        } else {
            mainTextField.text = ""
            Lable.text = ""
            reverseButton.isEnabled = false
            reverseButton.setTitle("Reverse", for: .normal)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        reverseButton.isEnabled = textField.text != nil
        return true
    }
    
    private func reverseText(_ text: String) -> String {
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

