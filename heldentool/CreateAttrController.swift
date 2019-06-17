//
//  CreateAttrController.swift
//  heldentool
//
//  Created by Marius Gerhard / PBS2H17A on 6/14/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

class CreateAttrController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //ImageViews
    @IBOutlet weak var portraitView: UIImageView!
    
    // OutLabels
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var hpLabel: UILabel!
    @IBOutlet weak var aspLabel: UILabel!
    @IBOutlet weak var karmaLabel: UILabel!
    
    @IBOutlet weak var attrTable: UITableView!
    
    //Data
    
    let attr = ["Mut", "Intuition", "Charisma", "Klugheit", "Fingerfertigkeit", "Gewandheit", "Körperkraft", "Konstitution"]
    
    let portrait = UIImage(named: "Krieger")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
         switch held.class {
         case: magier {
            if(held.gender == männlich){
                portrait = UIImage(named: "Magier")!
            }
            else{
                portrait = UIImage(named: "Magierin")!
            }
            case: priester {
                if(held.gender == männlich){
                    portrait = UIImage(named: "Priester")!
                }
                else{
                    portrait = UIImage(named: "Priesterin")!
                }
            }
            case: magier {
                if(held.gender == männlich){
                    portrait = UIImage(named: "Krieger")!
            }
                else{
                    portrait = UIImage(named: "Kriegerin")!
                }
            case: magier {
                if(held.gender == männlich){
                    portrait = UIImage(named: "Streuner")!
                }
                else{
                portrait = UIImage(named: "Streunerin")!
                }
         }
         
         // Sets our Labels
         portraitView = portrait
         
         */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return attr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "attrCell", for: indexPath)
        cell.textLabel?.text = attr[indexPath.row]
        return cell
    }
    
    
}
