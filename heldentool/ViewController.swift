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
                //self.datenParsenUndVerarbeiten (data: data!)
            }
        })
        
        //3 Task (also den Download) starten
        dataTask.resume()
    }
    
    func parseBaseData(data:Data?){
        print("Oberst von Bratwurst grüßt die Männer von der Fritten Braterei!")
    }

}

