//
//  ViewController.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 08.06.2022.
//

import UIKit

final class ReverseWordsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private weak var mainTextField: UITextField!
    @IBOutlet private weak var reverseWordsLabel: UILabel!
    @IBOutlet private weak var separator: UIView!
    @IBOutlet private weak var customWordsTextField: UITextField!
    @IBOutlet private weak var mainSegmentControl: UISegmentedControl!
    @IBOutlet private weak var customTextView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        customTextView.isHidden = true
        reverseWordsLabel.accessibilityIdentifier = "Label"
        customTextView.accessibilityIdentifier = "CustomTextView"
        customWordsTextField.accessibilityIdentifier = "CustomWordsTextField"
        mainTextField.accessibilityIdentifier = "MainTextField"
    }
    
    @IBAction func customTextFieldChanged() {
        guard let textFieldText = mainTextField.text else {
            return
        }
        guard let customTextFieldText = customWordsTextField.text else {
            reverseWordsLabel.text = textFieldText.reversedByWords(exception: "")
            return
        }
        reverseWordsLabel.text = textFieldText.reversedByWords(exception: customTextFieldText)
    }
    
    @IBAction func didChangeSegment() {
        if mainSegmentControl.selectedSegmentIndex == 0 {
            customTextView.isHidden = true
            guard let textFieldText = mainTextField.text else {
                return
            }
            reverseWordsLabel.text = textFieldText.reversedByWords()
        } else {
            guard let textFieldText = mainTextField.text else {
                return
            }
            customTextView.isHidden = false
            guard let customTextFieldText = customWordsTextField.text else {
                reverseWordsLabel.text = textFieldText.reversedByWords(exception: "")
                return
            }
            reverseWordsLabel.text = textFieldText.reversedByWords(exception: customTextFieldText)
        }
    }
    
    @IBAction func mainTextFieldChanged() {
        if mainTextField.text?.isEmpty == true {
            separator.backgroundColor = UIColor.lightGray
        } else {
            separator.backgroundColor = UIColor.systemBlue
            guard let textFieldText = mainTextField.text else {
                return
            }
            if mainSegmentControl.selectedSegmentIndex == 0 {
                reverseWordsLabel.text = textFieldText.reversedByWords()
            } else {
                guard let customTextFieldText = customWordsTextField.text else {
                    reverseWordsLabel.text = textFieldText.reversedByWords(exception: "")
                    return
                }
                reverseWordsLabel.text = textFieldText.reversedByWords(exception: customTextFieldText)
            }
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
}

