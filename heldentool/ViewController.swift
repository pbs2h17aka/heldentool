//
//  ViewController.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 5/24/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // und los gehts mit dem tollen Heldentool
        self.loadBaseData()
    }

    // Methode um den Stammdaten JSON abzufragen
    func loadBaseData(){
        
        //1 Datenquelle definieren:
        let URLString = "http://pbs2h17aka.web.pb.bib.de/jsonExample.php"
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
            
            enum CodingKeys : String, CodingKey {
                case RassenDaten = "0"  //Falls im jSon-String andere Bezeichner verwendet werden als in der passenden Klasse/Struct, kann so manuell zugeordnet werden
            }
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
            
            enum CodingKeys : String, CodingKey {
                case KulturDaten = "1"  //Falls im jSon-String andere Bezeichner verwendet werden als in der passenden Klasse/Struct, kann so manuell zugeordnet werden
            }
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
            
            enum CodingKeys : String, CodingKey {
                case ProfessionenDaten = "2"  //Falls im jSon-String andere Bezeichner verwendet werden als in der passenden Klasse/Struct, kann so manuell zugeordnet werden
            }
        }
        
        struct StammDaten : Decodable  {
            var Rassen : RassenDaten
            var Kulturen : KulturDaten
            var Professionen : ProfessionenDaten

            
            enum CodingKeys : String, CodingKey {
                case spielerArray = "alleSpieler"  //Falls im jSon-String andere Bezeichner verwendet werden als in der passenden Klasse/Struct, kann so manuell zugeordnet werden
            }
        }
    }

}

