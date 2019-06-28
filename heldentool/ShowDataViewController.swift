//
//  ShowDataViewController.swift
//  heldentool
//
//  Created by Marius Gerhard / PBS2H17A on 6/28/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

class ShowDataViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let attr = ["Mut", "Klugheit","Intuition", "Charisma",  "Fingerfertigkeit", "Gewandheit", "Körperkraft"]
    
    let skills = ["Waffen", "Magie","Wunder", "Gesellschaft",  "Wissen", "Handwerk", "Medizin", "Wildnis", "Heimlichkeit", "Athletik"]
    
    
    //SECTIONS
    /*
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "Attribute"
        }
        return "Fertigkeiten"
    }
    
    */
    // ROWS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 1){
            return attr.count
        }
        return skills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath)
        
        if( indexPath.section == 0){
            cell.textLabel?.text = attr[indexPath.row]
        }
        else{
            cell.textLabel?.text = attr[indexPath.row]
        }
        return cell
    }
    

    // Alle Labels
    @IBOutlet weak var lebenLabel: UILabel!
    @IBOutlet weak var magieLabel: UILabel!
    @IBOutlet weak var karmaLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var labelRasse: UILabel!
    @IBOutlet weak var cultureLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    
    // Image
    @IBOutlet weak var portraitImageView: UIImageView!
    
    //Table
    @IBOutlet weak var dataTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
