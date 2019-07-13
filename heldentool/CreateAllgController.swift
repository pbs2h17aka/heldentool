//
//  CreateAllgController.swift
//  heldentool
//
//  Created by Marius Gerhard / PBS2H17A on 6/14/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

// View zur Erstellung eines neuen Helden
// Wahl des Namens, der Rasse, der Kultur und der Profession
class CreateAllgController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Elemente
    @IBOutlet weak var nameView: UITextField!
    @IBOutlet weak var titleView: UITextField!
    @IBOutlet weak var genderBox: UISegmentedControl!
    
    // Picker
    // Tag 1
    @IBOutlet weak var racePicker: UIPickerView!
    // Tag 2
    @IBOutlet weak var culturePicker: UIPickerView!
    // Tag 3
    @IBOutlet weak var classPicker: UIPickerView!
    
    // Textfelder
    let name:String = ""
    let heldentitle:String = ""
    
    // Core Data Model
    let rasseModel = RasseModel.item
    let kulturModel = KulturModel.item
    let professionModel = ProfessionModel.item
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Select Box default setzen
        genderBox.selectedSegmentIndex = 0
        //Hintergrundfarbe setzen
        view.backgroundColor = UIColor(red: 233.0/255.0, green: 216.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        
        // Picker setzen
        // Rassen Picker
        self.racePicker.delegate = self
        self.racePicker.dataSource = self
        self.racePicker.selectRow(1, inComponent: 0, animated: true)
        SharedItem.meinHeld.addRasse(rasse : rasseModel.rassen[1])
        //Kulturen Picker
        self.culturePicker.delegate = self
        self.culturePicker.dataSource = self
        self.culturePicker.selectRow(1, inComponent: 0, animated: true)
        SharedItem.meinHeld.addKultur(kultur : kulturModel.kulturen[1])
        // Professionen Picker
        self.classPicker.delegate = self
        self.classPicker.dataSource = self
        self.classPicker.selectRow(1, inComponent: 0, animated: true)
        SharedItem.meinHeld.addProfession(profession : professionModel.professionen[1])
        
    }
    
    // Pro Picker wird nur eine Komponente benötigt
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Die Reihenanzahl eines Pickers hängt von der Menge der Stammdaten ab
    // Rasse, Kultur, Profession
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if( pickerView.tag == 1){
            //return raceData.count
            return rasseModel.rassen.count
        }
        if( pickerView.tag == 2){
            //return cultureData.count
            return kulturModel.kulturen.count
        }
        // Tag 3
        //return classData.count
        return professionModel.professionen.count
        
    }
    
    // Durchlauf der Stammdaten und setzen der Werte in die Reihen der Picker
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        // Stammdaten abfragen
        var rassen = rasseModel.rassenNamen
        var kulturen = kulturModel.kulturenNamen
        var professionen = professionModel.professionenNamen
        
        if( pickerView.tag == 1){
            return rassen[row]
        }
        if( pickerView.tag == 2){
            return kulturen[row]
        }
        // Tag 3
        return professionen[row]
        
    }
    
    // Methode um Rasse, Kultur, Profession in Shared Item zu übertragen
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if( pickerView.tag == 1){
            SharedItem.meinHeld.addRasse(rasse : rasseModel.rassen[row])
        }
        if( pickerView.tag == 2){
            SharedItem.meinHeld.addKultur(kultur : kulturModel.kulturen[row])
        }
        if( pickerView.tag == 3){
            SharedItem.meinHeld.addProfession(profession : professionModel.professionen[row])
        }
    }
    
    // Aufruf der nächsten View
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vorname:String
        var nachname:String
        
        // Default Werte setzen
        if(nameView.text == ""){
            vorname = "VDummy"
        }
        else{
            vorname = nameView.text!
        }
        if(titleView.text == ""){
            nachname = "NDummy"
        }
        else{
            nachname = titleView.text!
        }

        let geschlecht = genderBox.selectedSegmentIndex
        
        SharedItem.meinHeld.name = String(vorname + " " + nachname)
        SharedItem.meinHeld.geschlecht = Int32(geschlecht)
    }
}
