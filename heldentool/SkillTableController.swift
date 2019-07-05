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
        let text : String
        
        switch indexPath.row {
        case 0: text = "Athletik: \(SharedItem.meinHeld.athletik)"
        case 1: text = "Gesellschaft: \(SharedItem.meinHeld.gesellschaft)"
        case 2: text = "Handwerk: \(SharedItem.meinHeld.handwerk)"
        case 3: text = "Heimlichkeit: \(SharedItem.meinHeld.heimlichkeit)"
        case 4: text = "Magie: \(SharedItem.meinHeld.magie)"
        case 5: text = "Medizin: \(SharedItem.meinHeld.medizin)"
        case 6: text = "Waffen: \(SharedItem.meinHeld.waffen)"
        case 7: text = "Wildnis: \(SharedItem.meinHeld.wildnis)"
        case 8: text = "Wissen: \(SharedItem.meinHeld.wissen)"
        case 9: text = "Wunder: \(SharedItem.meinHeld.wunder)"
        default: text = "yee"
        }
        
        cell.textLabel?.text = text
        
        return cell
    }
    // ---------------------------------------------------------------------------------------------------
    
    // Speichern des neuen Helden in der Core Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        heldenModel.sendeHelden()
        //SharedItem.meinHeld.speicherHelden()
    }

}
