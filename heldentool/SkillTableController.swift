//
//  SkillTableController.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/28/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

// View zur Erstellung eines neuen Helden
// Anzeige und Vergabe von Fertigkeitspunkten
class SkillTableController: UITableViewController {
    
    // Core Data Model
    let heldenModel = HeldenModel.item
    
    override func viewDidLoad() {
        tableView.tableFooterView = UIView()
        
        super.viewDidLoad()
    }
    
    // Laden der neuen Werte aus dem Shared Item bevor View neu erscheint
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    // ---------------------------------------------------------------------------------------------------
    // TABLEVIEW METHODEN

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Methode zum Anzeigen des Titels der Table View
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        // Setzt den Hintergrund der TableView
        tableView.backgroundColor = UIColor(red: 233.0/255.0, green: 216.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        
        return "Attribute"
    }
    
    // Methode zum Aufbau der benötigten Reihen in der Tableview
    // Pro Fertigkeit eine Reihe
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    // Methode um Table View mit Helden Fertigkeiten aus dem Shared Item zu füllen
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath)
        //let text : String
        
        let name = cell.contentView.viewWithTag(1) as! UILabel
        let wert = cell.contentView.viewWithTag(2) as! UILabel
        
        switch indexPath.row {
        case 0: name.text = "Athletik:"
                wert.text = String(SharedItem.meinHeld.athletik)
        case 1: name.text = "Gesellschaft:"
                wert.text = String(SharedItem.meinHeld.gesellschaft)
        case 2: name.text = "Handwerk:"
                wert.text = String(SharedItem.meinHeld.handwerk)
        case 3: name.text = "Heimlichkeit:"
                wert.text = String(SharedItem.meinHeld.heimlichkeit)
        case 4: name.text = "Magie:"
                wert.text = String(SharedItem.meinHeld.magie)
        case 5: name.text = "Medizin:"
                wert.text = String(SharedItem.meinHeld.medizin)
        case 6: name.text = "Waffen:"
                wert.text = String(SharedItem.meinHeld.waffen)
        case 7: name.text = "Wildnis:"
                wert.text = String(SharedItem.meinHeld.wildnis)
        case 8: name.text = "Wissen:"
                wert.text = String(SharedItem.meinHeld.wissen)
        case 9: name.text = "Wunder:"
                wert.text = String(SharedItem.meinHeld.wunder)
        default: name.text = "yee"
        }
        
        return cell
    }
    // ---------------------------------------------------------------------------------------------------
    
    // Anpassen der Fähigkeiten oder
    // Speichern des neuen Helden in der Core Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "skillLevel") {
            let werteLeveln = segue.destination as? LevelPickerViewController
            werteLeveln!.index = 7 + tableView.indexPathForSelectedRow!.row
        } else {
            heldenModel.sendeHelden()
            SharedItem.meinHeld.speicherHelden()
        }
    }
}
