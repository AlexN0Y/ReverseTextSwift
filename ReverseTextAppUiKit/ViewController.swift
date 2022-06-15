//
//  ViewController.swift
//  ReverseTextAppUiKit
//
//  Created by Alex Gav on 08.06.2022.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var TextField: UITextField!
    @IBOutlet weak var ReversedTextLable: UILabel!
    
    @IBAction func ReverseButton(_ sender: Any) {
        var reversed: String = ""
        var tempString: String = ""
        
        if TextField.text != nil {
            for character in TextField.text! {
                if character == " " {
                tempString = String(tempString.reversed())
                reversed += tempString
                reversed += " "
                tempString = ""
                } else{
                tempString += String(character)
                }
            }
            
        tempString = String(tempString.reversed())
        reversed += tempString
        }
        
        ReversedTextLable.text = reversed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        TextField.resignFirstResponder()
        return true
    }
    
}

