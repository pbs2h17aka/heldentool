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

    // Klick auf dem Minus Button
    @IBAction func onMinus(_ sender: UIButton) {
        let index = sender.tag
        switch index {
            case 0:
                SharedItem.meinHeld.athletik -= 1
            case 1:
                SharedItem.meinHeld.gesellschaft -= 1
            case 2:
                SharedItem.meinHeld.handwerk -= 1
            case 3:
                SharedItem.meinHeld.heimlichkeit -= 1
            case 4:
                SharedItem.meinHeld.magie -= 1
            case 5:
                SharedItem.meinHeld.medizin -= 1
            case 6:
                SharedItem.meinHeld.waffen -= 1
            case 7:
                SharedItem.meinHeld.wildnis -= 1
            case 8:
                SharedItem.meinHeld.wissen -= 1
            case 9:
                SharedItem.meinHeld.wunder -= 1
            default: print("Fehler in Minus Click Event")
        }
        
        //self.tableView.reloadData()
    }
    
    // Klick auf den Plus Button
    @IBAction func onPlus(_ sender: UIButton) {
        let index = sender.tag
        switch index {
        case 0:
            SharedItem.meinHeld.athletik += 1
        case 1:
            SharedItem.meinHeld.gesellschaft += 1
        case 2:
            SharedItem.meinHeld.handwerk += 1
        case 3:
            SharedItem.meinHeld.heimlichkeit += 1
        case 4:
            SharedItem.meinHeld.magie += 1
        case 5:
            SharedItem.meinHeld.medizin += 1
        case 6:
            SharedItem.meinHeld.waffen += 1
        case 7:
            SharedItem.meinHeld.wildnis += 1
        case 8:
            SharedItem.meinHeld.wissen += 1
        case 9:
            SharedItem.meinHeld.wunder += 1
        default: print("Fehler in Minus Click Event")
        }
        
        //self.tableView.reloadData()
    }
    
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
        //let text : String
        
        let name = cell.contentView.viewWithTag(1) as! UILabel
        let wert = cell.contentView.viewWithTag(2) as! UILabel
        
        let minus = cell.contentView.viewWithTag(3) as! UIButton
        let plus = cell.contentView.viewWithTag(4) as! UIButton
        
        /*
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
         */
        
        switch indexPath.row {
        case 0: name.text = "Athletik:"
                wert.text = String(SharedItem.meinHeld.athletik)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 1: name.text = "Gesellschaft:"
                wert.text = String(SharedItem.meinHeld.gesellschaft)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 2: name.text = "Handwerk:"
                wert.text = String(SharedItem.meinHeld.handwerk)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 3: name.text = "Heimlichkeit:"
                wert.text = String(SharedItem.meinHeld.heimlichkeit)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 4: name.text = "Magie:"
                wert.text = String(SharedItem.meinHeld.magie)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 5: name.text = "Medizin:"
                wert.text = String(SharedItem.meinHeld.medizin)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 6: name.text = "Waffen:"
                wert.text = String(SharedItem.meinHeld.waffen)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 7: name.text = "Wildnis:"
                wert.text = String(SharedItem.meinHeld.wildnis)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 8: name.text = "Wissen:"
                wert.text = String(SharedItem.meinHeld.wissen)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        case 9: name.text = "Wunder:"
                wert.text = String(SharedItem.meinHeld.wunder)
                minus.tag = indexPath.row
                plus.tag = indexPath.row
        default: name.text = "yee"
        }
        
        //cell.textLabel?.text = text
        
        return cell
    }
    // ---------------------------------------------------------------------------------------------------
    
    // Speichern des neuen Helden in der Core Data
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        heldenModel.sendeHelden()
        SharedItem.meinHeld.speicherHelden()
    }
    
    

}
