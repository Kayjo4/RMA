//
//  FirstViewController.swift
//  RMA
//
//  Created by CIS Student on 10/31/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    var dummyData = DummyData2()
    
    @IBOutlet weak var typeTextfield: UITextField!
    @IBOutlet weak var acronymTextField: UITextField!
    @IBOutlet weak var definitionTextView: UITextView!
    
    var delegate: AcronymDelegate?
    var textViewFirstClick: Bool = true
    var picker = UIPickerView()
    var type: Acronym.AcronymType?
    var acronym: String?
    var definition: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        typeTextfield.inputView = picker
        acronymTextField.delegate = self
        definitionTextView.delegate = self
        
        definitionTextView.layer.borderWidth = 1
        definitionTextView.layer.borderColor = UIColor.lightGray.cgColor
        definitionTextView.layer.cornerRadius = 4
    }
    
    @IBAction func doneBarButtonWasSelected(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        if type != nil && acronym != nil && definition != nil {
            delegate?.addAcronym(type: type!, acronym: acronym!, definition: definition!)
            _ = navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Finish Fields", message: "All of the fields are required. Finish filling them out and try again.", preferredStyle: UIAlertControllerStyle.alert)
            let okayButton = UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okayButton)
            present(alert, animated: true, completion: nil)
        }
    }
}

extension FirstViewController: UIPickerViewDelegate {
    func numberOfComponentsInPickerView(_ pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: String) -> Int {
        return dummyData.types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        typeTextfield.text = dummyData.types[row]
        type = Acronym.AcronymType(rawValue: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dummyData.types[row]
    }
}

extension FirstViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text != nil && textField.text != "" {
            acronym = textField.text
        }
    }
}

extension FirstViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text != nil && textView.text != "" {
            definition = textView.text
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        if textView.text == "" {
            textView.text = "Add Definition"
            textView.textColor = UIColor.darkGray
            textViewFirstClick = true
            view.endEditing(true)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textViewFirstClick {
            textView.text = ""
            textView.textColor = UIColor.black
            textViewFirstClick = false
        }
    }
}
