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
            var Rassen : RassenDaten
            var Kulturen : KulturDaten
            var Professionen : ProfessionenDaten

            enum CodingKeys : String, CodingKey {
                case Rassen = "0"
                case Kulturen = "1"
                case Professionen = "2"
            }
        }
    }

}

