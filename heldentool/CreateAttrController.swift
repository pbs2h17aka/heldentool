//
//  CreateAttrController.swift
//  heldentool
//
//  Created by Marius Gerhard / PBS2H17A on 6/14/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

// View zur Erstellung eines neuen Helden
// Anzeige des Steckbriefes, Anzeige und Vergabe von Attributspunkten
class CreateAttrController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Image View
    @IBOutlet weak var portraitView: UIImageView!
    
    // Labels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var aspLabel: UILabel!
    @IBOutlet weak var karmaLabel: UILabel!
    
    @IBOutlet weak var attrTable: UITableView!
    
    // default
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Hintergrundfarbe setzen
        view.backgroundColor = UIColor(red: 233.0/255.0, green: 216.0/255.0, blue: 173.0/255.0, alpha: 1.0)

        hpLabel.text = String(SharedItem.meinHeld.leben)
        aspLabel.text = String(SharedItem.meinHeld.magie)
        karmaLabel.text = String(SharedItem.meinHeld.karma)
        nameLabel.text = SharedItem.meinHeld.name
        
        var portrait = UIImage(named: "Krieger")
         
        // Abhängigkeit von der Profession, dann vom Geschlecht
        switch String(SharedItem.meinHeld.profession) {
            case "Zauberer" :
                if(SharedItem.meinHeld.geschlecht == 1){portrait = UIImage(named: "Magier")!}
                else{portrait = UIImage(named: "Magierin")!}
            case "Priester" :
                if(SharedItem.meinHeld.geschlecht == 1){portrait = UIImage(named: "Priester")!}
                else{portrait = UIImage(named: "Priesterin")!}
            case "Krieger" :
                if(SharedItem.meinHeld.geschlecht == 1){portrait = UIImage(named: "Krieger")!}
                else{portrait = UIImage(named: "Kriegerin")!}
            case "Streuner" :
                if(SharedItem.meinHeld.geschlecht == 1){portrait = UIImage(named: "Streuner")!}
                else{portrait = UIImage(named: "Streunerin")!}
            default :
            print("Fehler beim Laden des Heldenportraits!")
         }
 
         // Heldenportrait anzeigen
         portraitView.image = portrait
    }
    
    // Laden der neuen Werte aus dem Shared Item bevor View neu erscheint
    override func viewWillAppear(_ animated: Bool) {
        self.attrTable.reloadData()
    }
    
    // ---------------------------------------------------------------------------------------------------
    // TABLEVIEW METHODEN
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Methode zum Anzeigen des Titels der Table View
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        // Setzt den Hintergrund der TableView
        tableView.backgroundColor = UIColor(red: 233.0/255.0, green: 216.0/255.0, blue: 173.0/255.0, alpha: 1.0)
        
        if( section == 0){
            return "Attribute"
        }
        return "Section \(section)"
    }
    
    // Methode zum Aufbau der benötigten Reihen in der Tableview
    // Pro Attribut eine Reihe
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    // Methode um Table View mit Helden Attributen aus dem Shared Item zu füllen
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "attrCell", for: indexPath)
        //let text : String
        
        let name = cell.contentView.viewWithTag(1) as! UILabel
        let wert = cell.contentView.viewWithTag(2) as! UILabel
        
        switch indexPath.row {
        case 0: name.text = "Charisma:"
        wert.text = String(SharedItem.meinHeld.charisma)
        case 1: name.text = "Fingerfertigkeit:"
        wert.text = String(SharedItem.meinHeld.fingerfertigkeit)
        case 2: name.text = "Gewandheit:"
        wert.text = String(SharedItem.meinHeld.gewandheit)
        case 3: name.text = "Intuition:"
        wert.text = String(SharedItem.meinHeld.intuition)
        case 4: name.text = "Klugheit:"
        wert.text = String(SharedItem.meinHeld.klugheit)
        case 5: name.text = "Körperkraft:"
        wert.text = String(SharedItem.meinHeld.koerperkraft)
        case 6: name.text = "Mut:"
        wert.text = String(SharedItem.meinHeld.mut)
        default: name.text = "yee"
        }
        
        return cell
    }
    
    // ---------------------------------------------------------------------------------------------------
    
    // Anpassen der Attribute
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "attrLevel") {
            let werteLeveln = segue.destination as? LevelPickerViewController
            werteLeveln!.index = attrTable.indexPathForSelectedRow!.row
        }
    }

}
