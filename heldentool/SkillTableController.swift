//
//  SkillTableController.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/28/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

class SkillTableController: UITableViewController {

    let attribute = ["Waffen","Magie","Wunder","Gesellschaft","Wissen","Handwerk","Medizin","Wildnis","Heimlichkeit","Atheltik"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    // ---------------------------------------------------------------------------------------------------
    // TABLEVIEW METHODEN

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Attribute"
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attribute.count
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
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
