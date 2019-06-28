//
//  CreateAllgController.swift
//  heldentool
//
//  Created by Marius Gerhard / PBS2H17A on 6/14/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

class CreateAllgController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Normal Elements
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var titleView: UITextField!
    @IBOutlet weak var genderBox: UISegmentedControl!
    // Picker
    // Tag1
    @IBOutlet weak var racePicker: UIPickerView!
    // Tag 2
    @IBOutlet weak var culturePicker: UIPickerView!
    // Tag 3
    @IBOutlet weak var classPicker: UIPickerView!
    
    // Text Inputs
    let name:String = ""
    let heldentitle:String = ""
    
    // Our Data as array
    let raceData = ["Zwerg","Elf","Mensch","Halbelf"]
    let cultureData = ["NordLande", "Mittellande", "Südlande"]
    let classData = ["Streuner","Magier","Priester","Krieger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sets our Picker
        self.racePicker.delegate = self
        self.racePicker.dataSource = self
        self.culturePicker.delegate = self
        self.culturePicker.dataSource = self
        self.classPicker.delegate = self
        self.classPicker.dataSource = self
        
    }
    // All components one row
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // Number of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if( pickerView.tag == 1){
            return raceData.count
        }
        if( pickerView.tag == 2){
            return cultureData.count
        }
        // Tag 3
        return classData.count
        
        
    }
    // Sets our Data
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView.tag == 1){
            return raceData[row]
        }
        if( pickerView.tag == 2){
            return cultureData[row]
        }
        // Tag 3
        return classData[row]
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if( pickerView.tag == 1){
        }
        if( pickerView.tag == 2){
        }
        if( pickerView.tag == 3){
        }
        
    }
    

}
