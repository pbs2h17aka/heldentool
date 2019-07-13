//
//  LevelPickerViewController.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 7/13/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

class LevelPickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // ausgewählte Eigentschaft/Fertigkeit
    var index = 0
    var selected = 0
    
    // Elemente
    @IBOutlet weak var nameLabel: UILabel!
    
    // Picker
    @IBOutlet weak var wertPicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setzt den Hintergrund
        view.backgroundColor = UIColor(red: 233.0/255.0, green: 216.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        
        // Bezeichnung für ausgewähltes Attribut / ausgewählte Fertigkeit setzten
        nameLabel.text = SharedItem.meinHeld.zeigeBezeichnung(index: index)
    }
    

    // Wert der ausgewählten Eigenschaft/Fertigkeit in Picker View anzeigen
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Methode um die ANzahl des Pickers zu definieren
    // Abhängig von Herkunftsview
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // Reihenzahl wenn Attribute angezeigt werden
        if ( self.index < 7) {
            return 12
        }
        // Reihenzahl wenn Fertigkeiten angezeigt werden
        else {
            return 15
        }
    }
    
    // Picker mit Weren befüllen
    // untere Grenze bei aktuellem Wert
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(row + 1)
    }
    
    // Methode um ausgewählte Reihe zu erhalten
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selected = row + 1
        // neuen Wert im Shared Model setzen
        SharedItem.meinHeld.setzeWert(index : index, wert: selected)
    }
}
