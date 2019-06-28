//
//  ShowDataViewController.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/28/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

class ShowDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // TABLE AND VIEW
    @IBOutlet weak var dataTable: UITableView!
    @IBOutlet weak var portraitView: UIImageView!
    
    // ALL LABELS
    @IBOutlet weak var lebenLabel: UILabel!
    @IBOutlet weak var magieLabel: UILabel!
    @IBOutlet weak var karmaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rasseLabel: UILabel!
    @IBOutlet weak var kulturLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    
    //SECTIONS
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Attribute"
        }
        else{
            return "Fertigkeiten"
        }
    }
    
    //ROWS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return 2
        }
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"

        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //SHOWS THE IMAGE
        portraitView.image = getPortrait()
        //SETS OUR CUSTOM DATA
    }
    // CHOOSES THE CORRECT UIMAGE
    func getPortrait()->UIImage{
        
        let portrait = UIImage(named: "Krieger")
        /* AKTIVATE IF DATA IS AVAILABLE
         
        switch held.profession {
        case: zauberer {
            if(held.geschlecht == männlich){
                portrait = UIImage(named: "Magier")!
            }
            else{
                portrait = UIImage(named: "Magierin")!
            }
            case: priester {
                if(held.geschlecht == männlich){
                    portrait = UIImage(named: "Priester")!
                }
                else{
                    portrait = UIImage(named: "Priesterin")!
                }
            }
            case: krieger {
                if(held.geschlecht == männlich){
                    portrait = UIImage(named: "Krieger")!
                }
                else{
                    portrait = UIImage(named: "Kriegerin")!
                }
            case: streuner {
                if(held.geschlecht == männlich){
                    portrait = UIImage(named: "Streuner")!
                }
                else{
                    portrait = UIImage(named: "Streunerin")!
                    }
                }
                */
            return portrait!
    }
    // SETS OUR CUSTOM DATA
    func setCustomData()->Void{
        /*
        lebenLabel.text = held.leben
        magieLabel.text = held.magie
        karmaLabel.text = held.karma
        nameLabel.text = held.name
        rasseLabel.text = held.rasse
        kulturLabel.text = held.kultur
        classLabel.text = held.profession
    */
    }
}
