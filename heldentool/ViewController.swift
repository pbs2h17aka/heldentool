//
//  ViewController.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 5/24/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var alleRassen : [Any] = Array()
    var alleKulturen : [Any] = Array()
    var alleProfessionen : [Any] = Array()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // und los gehts mit dem tollen Heldentool
        self.loadBaseData()
    }

    // Methode um den Stammdaten JSON abzufragen
    func loadBaseData(){
        
        //1 Datenquelle definieren:
        let URLString = "http://pbs2h17aka.web.pb.bib.de/SIA/heldentool.php"
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let searchURL = URL(string: URLString)
        let urlRequest = URLRequest(url: searchURL!)
        
        //2 Task definieren zum Laden, wird parallel zum weiteren Geschehen ausgeführt:
        let dataTask = session.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if error != nil {
                print("Fehler beim Laden: " + error!.localizedDescription)
            }
            else
            {
                //das wird ausgeführt, wenn die Daten vollständig geladen wurden
                self.parseBaseData (data: data!)
            }
        })
        
        //3 Task (also den Download) starten
        dataTask.resume()
    }
    
    func parseBaseData(data:Data?){

        struct RassenDaten : Decodable {
            var name : String
            var mut : Int
            var klugheit : Int
            var intuition : Int
            var charisma : Int
            var fingerfertigkeit : Int
            var gewandheit : Int
            var koerperkraft : Int
        }
        
        struct KulturDaten : Decodable {
            var name : String
            var waffen : Int
            var magie : Int
            var wunder : Int
            var gesellschaft : Int
            var wissen : Int
            var handwerk : Int
            var medizin : Int
            var wildnis : Int
            var heimlichkeit : Int
            var athletik : Int
        }
        
        struct ProfessionenDaten : Decodable {
            var name : String
            var waffen : Int
            var magie : Int
            var wunder : Int
            var gesellschaft : Int
            var wissen : Int
            var handwerk : Int
            var medizin : Int
            var wildnis : Int
            var heimlichkeit : Int
            var athletik : Int
        }
        
        struct StammDaten : Decodable  {
            var Rassen : [RassenDaten]
            var Kulturen : [KulturDaten]
            var Professionen : [ProfessionenDaten]
        }
        
        struct AlleDaten : Decodable {
            var alleDaten : StammDaten
        }
        
        if data != nil {
            
            //let dataString = String(data:  data!, encoding: String.Encoding.utf8)
            //print(dataString!)
            
            let stammDaten = try? JSONDecoder().decode(AlleDaten.self, from: data!)
            
            if stammDaten == nil {
                print("Error: Couldn't decode data into Stammdaten")
            }
            else
            {
                alleRassen = stammDaten!.alleDaten.Rassen
                print (" \(  alleRassen.count) Rassen: \(alleRassen)")
                
                alleKulturen = stammDaten!.alleDaten.Kulturen
                print (" \(  alleKulturen.count) Kulturen: \(alleKulturen)")
                
                alleProfessionen = stammDaten!.alleDaten.Professionen
                print (" \(  alleProfessionen.count) Professionen: \(alleProfessionen)")
                
                
                
                
                //DispatchQueue.main.async {
                //Main Thread die Oberfläche aktualisieren lassen, z.B.:
                //self.tableView.reloadData()
                //}
            }

        }
        else {
            print("nichts erhalten")
        }
        
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

