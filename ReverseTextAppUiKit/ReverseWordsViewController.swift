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
        setupAccessibility()
    }
    
    private func setupAccessibility(){
        reverseWordsLabel.accessibilityIdentifier = "Label"
        customTextView.accessibilityIdentifier = "CustomTextView"
        customWordsTextField.accessibilityIdentifier = "CustomWordsTextField"
        mainTextField.accessibilityIdentifier = "MainTextField"
    }
    
    private func reverseOnChange() -> Void {
        guard let textFieldText = mainTextField.text else {
            return
        }
        if mainSegmentControl.selectedSegmentIndex == 0 {
            reverseWordsLabel.text = textFieldText.reverseLettersOnly()
        } else {
            guard let customTextFieldText = customWordsTextField.text else {
                reverseWordsLabel.text = textFieldText.reversedByWords(exception: "")
                return
            }
            reverseWordsLabel.text = textFieldText.reversedByWords(exception: customTextFieldText)
        }
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
        customTextView.isHidden = !customTextView.isHidden
        reverseOnChange()
    }
    
    @IBAction func mainTextFieldChanged() {
        if mainTextField.text?.isEmpty == true {
            separator.backgroundColor = UIColor.lightGray
            reverseWordsLabel.text = ""
        } else {
            separator.backgroundColor = UIColor.systemBlue
            reverseOnChange()
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

