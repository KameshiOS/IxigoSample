//
//  SearchFlightVC.swift
//  Ixigo
//
//  Created by Kamesh on 28/06/19.
//  Copyright © 2019 fashionexpress. All rights reserved.
//

import UIKit

class SearchFlightVC: UIViewController {

    @IBOutlet weak var passengerTF: UITextField!
    @IBOutlet weak var classTF: UITextField!
    
    var classPicker = UIPickerView()
    
    var passenger: Int = 1
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passengerTF.delegate = self
        classPicker.delegate = self
        classPicker.dataSource = self
        classTF.inputView = classPicker
    }
    @IBAction func SearchButtonAction(_ sender: Any) {
        let destVC = storyboard?.instantiateViewController(withIdentifier: "FlightsVC") as! FlightsVC
        destVC.passenger = passenger
        destVC.flightClass = classTF.text ?? "Any"
        navigationController?.pushViewController(destVC, animated: true)
    }
}
extension SearchFlightVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == passengerTF {
            textField.text = ""
        }
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField == passengerTF {
            if textField.text == "" {
                passenger = 1
                textField.text = "1 Adult"
            } else {
                passenger = Int(textField.text!) ?? 1
                textField.text = textField.text! + " Adult"
            }
        }
        return true
    }
}
extension SearchFlightVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return flightClassArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return flightClassArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        classTF.text = flightClassArray[row]
    }
}
