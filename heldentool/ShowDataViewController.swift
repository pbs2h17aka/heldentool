//
//  ShowDataViewController.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/28/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

// Detailview nach Auswahl eines Helden in der Startview, Anzeige des Heldendokumentes
class ShowDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // ausgewählter Held
    var heldenIndex = 0
    
    // Table und View
    @IBOutlet weak var dataTable: UITableView!
    @IBOutlet weak var portraitView: UIImageView!
    
    // Labels
    @IBOutlet weak var lebenLabel: UILabel!
    @IBOutlet weak var magieLabel: UILabel!
    @IBOutlet weak var karmaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rasseLabel: UILabel!
    @IBOutlet weak var kulturLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    
    // Core Data Model
    let heldenModel = HeldenModel.item
    
    // ---------------------------------------------------------------------------------------------------
    // TABLEVIEW METHODEN
    
    // Sektionen
    // eine Sektion zur Darstellung der Attribute
    // eine Sektion zur Darstellung der Fertigkeiten
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    // Titel der beiden Sektionen
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Attribute"
        }
        else{
            return "Fertigkeiten"
        }
    }
    
    // Reihen
    // Anzahl ist Abhängig von der Sektion (Attribute oder Fertigkeiten)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            // Es gibt 7 Helden Attribute
            return 7
        }
        // Es gibt 10 Helden Fertigkeiten
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Bestimmung des ausgewwählten Helden durch übergebenen Index
        var held : Held
        held = heldenModel.helden[heldenIndex]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        var text : String
        
        // Sektion mit den Attributen
        if(indexPath.section == 0) {
            switch indexPath.row {
                case 0: text = "Charisma: \(held.charisman)"
                case 1: text = "Fingerfertigkeit: \(held.fingerfertigkeit)"
                case 2: text = "Gewandheit: \(held.gewandheit)"
                case 3: text = "Intuition: \(held.intuition)"
                case 4: text = "Klugheit: \(held.klugheit)"
                case 5: text = "Körperkraft: \(held.koerperkraft)"
                case 6: text = "Mut: \(held.mut)"
                default: text = "yee"
            }
        }
        // Sektion mit den Fertigkeiten
        else {
            switch indexPath.row {
            case 0: text = "Athletik: \(held.athletik)"
            case 1: text = "Gesellschaft: \(held.gesellschaft)"
            case 2: text = "Handwerk: \(held.handwerk)"
            case 3: text = "Heimlichkeit: \(held.heimlichkeit)"
            case 4: text = "Magie: \(held.magie)"
            case 5: text = "Medizin: \(held.medizin)"
            case 6: text = "Waffen: \(held.waffen)"
            case 7: text = "Wildnis: \(held.wildnis)"
            case 8: text = "Wissen: \(held.wissen)"
            case 9: text = "Wunder: \(held.wunder)"
            default: text = "yee"
            }
        }
        
        cell.textLabel?.text = text
        
        //var yees = Held.entity().attributesByName.enumerated().makeIterator()
        
        return cell
    }
    
    // ---------------------------------------------------------------------------------------------------
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Bestimmung des ausgewwählten Helden durch übergebenen Index
        var held : Held
        held = heldenModel.helden[heldenIndex]
        
        // Anzeigen eines Heldenportraits
        portraitView.image = getPortrait(held : held)
        
        // Befüllung des Helden Steckbriefes
        schreibeSteckbrief(held : held)
    }
    
    // Methode zur Darstellung eines Heldenportraits
    func getPortrait(held : Held)->UIImage{
        
        // Heldenportrait
        var portrait = UIImage(named: "Krieger")
        
        // Abhängigkeit von der Profession, dann vom Geschlecht
        switch String(held.profession!) {
            case "Zauberer" :
                    if(held.geschlecht == 1){portrait = UIImage(named: "Magier")!}
                    else{portrait = UIImage(named: "Magierin")!}
            case "Priester" :
                    if(held.geschlecht == 1){portrait = UIImage(named: "Priester")!}
                    else{portrait = UIImage(named: "Priesterin")!}
            case "Krieger" :
                    if(held.geschlecht == 1){portrait = UIImage(named: "Krieger")!}
                    else{portrait = UIImage(named: "Kriegerin")!}
            case "Streuner" :
                    if(held.geschlecht == 1){portrait = UIImage(named: "Streuner")!}
                    else{portrait = UIImage(named: "Streunerin")!}
            default :
                    print("Fehler beim Laden des Heldenportraits!")
        }
        
        return portrait!
    }
    
    // Methode um Heldensteckbrief zu befüllen
    func schreibeSteckbrief(held : Held)->Void{
        lebenLabel.text = String(held.leben)
        magieLabel.text = String(held.magie)
        karmaLabel.text = String(held.karma)
        nameLabel.text = "held.name"
        rasseLabel.text = held.rasse
        kulturLabel.text = held.kultur
        classLabel.text = held.profession
    }
}
