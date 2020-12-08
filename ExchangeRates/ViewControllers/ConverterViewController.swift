//
//  ConverterViewController.swift
//  ExchangeRates
//
//  Created by Evgeniy Chernyshov on 02/12/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import UIKit

class ConverterViewController: UIViewController {
    
    var currencyArray = [Model]()
    var currencyNames = [String]()
    var currencyInt = [Double]()
    
    var currentNumber: Double = 0
    var isFirstEditind = true
    var firstModel: Model?
    var secondModel: Model?
    
    
    @IBOutlet var secondTextField: UITextField!
    {
        didSet {
            secondTextField.addTarget(self, action: #selector(didChangedSecond), for: .editingChanged)
        }
    }
    @IBOutlet var firstTextField: UITextField! {
        didSet {
            firstTextField.addTarget(self, action: #selector(didChangedFirst), for: .editingChanged)
            
        }
    }
    @IBOutlet var uahLabel: UILabel! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didChangedFirstLabel))
            uahLabel.addGestureRecognizer(tapGesture)
        }
    }
    
    @IBOutlet var currencyLabel: UILabel! {
        didSet {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didChangedSecondLabel))
            currencyLabel.addGestureRecognizer(tapGesture)
        }
    }
    @IBOutlet var currencyPicker: UIPickerView!
    
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var output: UILabel!
    
    @IBAction func calculate(_ sender: AnyObject) {
        let textfieldInt: Int? = Int(textField1.text!)
        let textfield2Int: Int? = Int(textField2.text!)
        let convert = textfieldInt! + textfield2Int!
        let convertText = String(convert)
        output.text = convertText
    }
    
    @IBAction func didChangedFirst() {
        guard let firstText = firstTextField.text,
              let doubleNumber = Double(firstText) else { return }
        secondTextField.text = "\(doubleNumber * currentNumber)"
    }
    
    @IBAction func didChangedSecond() {
        guard let secondText = secondTextField.text,
              let doubleNumber = Double(secondText) else { return }
        firstTextField.text = "\(doubleNumber * currentNumber)"
    }
    
    @IBAction func didChangedFirstLabel() {
        isFirstEditind = false
    }
    
    @IBAction func didChangedSecondLabel() {
        isFirstEditind = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstModel = currencyArray.first
        secondModel = currencyArray[1]
        secondTextField.delegate = self
        firstTextField.delegate = self
        currencyLabel.text = currencyNames.first
        currentNumber = currencyArray.first?.currencyValue ?? 0
        
        
    }
}

extension ConverterViewController:  UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return currencyArray.count
        
    }
}
extension ConverterViewController:  UIPickerViewDelegate {
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return currencyNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        currencyLabel.text = currencyNames[row]
        currentNumber = currencyInt[row]
    }
}
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        guard let first = firstModel , let second = secondModel else { return }
//        if isFirstEditind {
//            currencyLabel.text = currencyNames[row]
//            firstModel = currencyArray[row]
//        } else {
//            uahLabel.text = currencyNames[row]
//            secondModel = currencyArray[row]
//        }
//
//        currentNumber = first.currencyValue / second.currencyValue
//
//
//    }
//}

extension ConverterViewController: UITextFieldDelegate  {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        //For numers
        if textField == firstTextField {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789.,")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        } else if textField == secondTextField {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789.,")//Here change this characters based on your requirement
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
        return true
    }
    
    
    
    
}

