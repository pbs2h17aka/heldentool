//
//  ViewController.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 5/24/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import UIKit

// Startview, App Logo und Übersicht der verfügbaren Helden
class ViewController: UIViewController,
UITableViewDelegate, UITableViewDataSource {
    
    // Logo
    let imageLogo = UIImage(named: "Logo")!
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logo: UIImageView!
    
    // Core Data Model
    let rasseModel = RasseModel.item
    let kulturModel = KulturModel.item
    let professionModel = ProfessionModel.item
    let heldenModel = HeldenModel.item
    
    var alleRassen : [RassenDaten] = Array()
    var alleKulturen : [KulturDaten] = Array()
    var alleProfessionen : [ProfessionenDaten] = Array()
    
    // Structs
    // Rassen
    struct RassenDaten : Decodable {
        var name : String
        var mut : Int32
        var klugheit : Int32
        var intuition : Int32
        var charisma : Int32
        var fingerfertigkeit : Int32
        var gewandheit : Int32
        var koerperkraft : Int32
    }
    // Kultur
    struct KulturDaten : Decodable {
        var name : String
        var waffen : Int32
        var magie : Int32
        var wunder : Int32
        var gesellschaft : Int32
        var wissen : Int32
        var handwerk : Int32
        var medizin : Int32
        var wildnis : Int32
        var heimlichkeit : Int32
        var athletik : Int32
    }
    // Professionen
    struct ProfessionenDaten : Decodable {
        var name : String
        var waffen : Int32
        var magie : Int32
        var wunder : Int32
        var gesellschaft : Int32
        var wissen : Int32
        var handwerk : Int32
        var medizin : Int32
        var wildnis : Int32
        var heimlichkeit : Int32
        var athletik : Int32
    }
    // Stammdaten: Rassen + Kulturen + Professionen
    struct StammDaten : Decodable  {
        var Rassen : [RassenDaten]
        var Kulturen : [KulturDaten]
        var Professionen : [ProfessionenDaten]
    }
    // JSON Formartierung
    struct AlleDaten : Decodable {
        var alleDaten : StammDaten
    }
    
    
    // ---------------------------------------------------------------------------------------------------
    // TABLEVIEW METHODEN
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Jeder Held wird in einer eigenen Sektion angezeigt
        return heldenModel.helden.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Pro Sektion wird eine Reihe zur Darstellung des Namen benötigt
        return 1
        //return test.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // Heldenname als Titel jeder Sektion
        return heldenModel.helden[section].name
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath)
        //cell.textLabel?.text = "zum Heldendokument"
        //let held = heldenModel.helden[indexPath.row]
        //cell.textLabel?.text = "\(held.rasse!), \(held.kultur!), \(held.profession!)"
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let heldendokument = segue.destination as? ShowDataViewController
        //heldendokument!.heldenIndex = tableView.indexPathForSelectedRow!.section}
        heldendokument!.heldenIndex = tableView.indexPathForSelectedRow!.section
    }

    // ---------------------------------------------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
        logo.image = imageLogo
        self.loadBaseData()
        self.createDummyHeroes()
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
    
    // Methode um die Stammdaten in die Core Data zu schreiben
    func parseBaseData(data:Data?){
        // Verarbeitung der Stammdaten wenn vorhanden
        if data != nil {
            let stammDaten = try? JSONDecoder().decode(AlleDaten.self, from: data!)
            
            if stammDaten == nil {
                print("Fehler: Stammdaten konnten nicht verarbeitet werden")
            }
            else
            {
                // Stammdaten selektieren und zur Übertragung in
                // Core Data vorbereiten
                alleRassen = stammDaten!.alleDaten.Rassen
                alleKulturen = stammDaten!.alleDaten.Kulturen
                alleProfessionen = stammDaten!.alleDaten.Professionen
                
                // Durchlauf aller abgefragten assen
                for r in alleRassen {
                    // Übertragung der Rassen in die Core Data
                    let rasse = rasseModel.createRasse()
                    rasse.name = r.name
                    rasse.mut = r.mut
                    rasse.klugheit = r.klugheit
                    rasse.intuition = r.intuition
                    rasse.charisma = r.charisma
                    rasse.fingerfertigkeit = r.fingerfertigkeit
                    rasse.gewandheit = r.gewandheit
                    rasse.koerperkraft = r.koerperkraft
                }
                
                // Durchlauf aller abgefragten Kulturen
                for k in alleKulturen {
                    // Übertragung der Kulturen in die Core Data
                    let kultur = kulturModel.createKultur()
                    kultur.name = k.name
                    kultur.waffen = k.waffen
                    kultur.magie = k.magie
                    kultur.wunder = k.wunder
                    kultur.gesellschaft = k.gesellschaft
                    kultur.wissen = k.wissen
                    kultur.handwerk = k.handwerk
                    kultur.medizin = k.medizin
                    kultur.wildnis = k.wildnis
                    kultur.heimlichkeit = k.heimlichkeit
                    kultur.athletik = k.athletik
                }
                
                // Durchlauf aller abgefragten Professionen
                for p in alleProfessionen {
                    // Übertragung der Professionen in die Core Data
                    let profession = professionModel.createProfession()
                    profession.name = p.name
                    profession.waffen = p.waffen
                    profession.magie = p.magie
                    profession.wunder = p.wunder
                    profession.gesellschaft = p.gesellschaft
                    profession.wissen = p.wissen
                    profession.handwerk = p.handwerk
                    profession.medizin = p.medizin
                    profession.wildnis = p.wildnis
                    profession.heimlichkeit = p.heimlichkeit
                    profession.athletik = p.athletik
                }
                
                // Ausgabe der Stammdaten aus der Core Data
                //print("Stammdaten aus der Core Data")
                //print("Rassen:")
                //print(rasseModel.rassenNamen)
                //print("Kulturen:")
                //print(kulturModel.kulturenNamen)
                //print("Professionen")
                //print(professionModel.professionenNamen)
            }

        }
        // Fehlermeldung, wenn keine Stammdaten vorhanden sind
        else {
            print("Fehler: Keine Stammdaten erhalten.")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Methode zum Erstellen von Dummy Helden
    func createDummyHeroes() {
        
        // Held Alara Delazar, Magierin
        let h1 = heldenModel.createHeld();
        h1.astral = 35
        h1.athletik = 10
        h1.charisman = 18
        h1.fingerfertigkeit = 16
        h1.gesellschaft = 12
        h1.geschlecht = 0
        h1.gewandheit = 20
        h1.handwerk = 13
        h1.heimlichkeit = 15
        h1.intuition = 13
        h1.karma = 0
        h1.klugheit = 17
        h1.kultur = "Suedlaender"
        h1.koerperkraft = 9
        h1.leben = 28
        h1.magie = 20
        h1.medizin = 15
        h1.mut = 14
        h1.name = "Magistra Alara Delazar"
        h1.profession = "Zauberer"
        h1.rasse = "Mensch"
        h1.waffen = 8
        h1.wildnis = 10
        h1.wissen = 20
        h1.wunder = 0
        
        // Held Sven Olafson, Krieger
        let h2 = heldenModel.createHeld();
        h2.astral = 0
        h2.athletik = 14
        h2.charisman = 9
        h2.fingerfertigkeit = 13
        h2.gesellschaft = 11
        h2.geschlecht = 1
        h2.gewandheit = 12
        h2.handwerk = 16
        h2.heimlichkeit = 12
        h2.intuition = 14
        h2.karma = 0
        h2.klugheit = 12
        h2.kultur = "Nordlaender"
        h2.koerperkraft = 19
        h2.leben = 45
        h2.magie = 0
        h2.medizin = 5
        h2.mut = 15
        h2.name = "Sir Sven Olafson"
        h2.profession = "Krieger"
        h2.rasse = "Mensch"
        h2.waffen = 20
        h2.wildnis = 14
        h2.wissen = 12
        h2.wunder = 0
        
        // Held Ardo-jin Ghune, Streuner
        let h3 = heldenModel.createHeld();
        h3.astral = 0
        h3.athletik = 12
        h3.charisman = 18
        h3.fingerfertigkeit = 13
        h3.gesellschaft = 16
        h3.geschlecht = 1
        h3.gewandheit = 14
        h3.handwerk = 12
        h3.heimlichkeit = 15
        h3.intuition = 13
        h3.karma = 0
        h3.klugheit = 12
        h3.kultur = "Mittellaender"
        h3.koerperkraft = 14
        h3.leben = 35
        h3.magie = 0
        h3.medizin = 8
        h3.mut = 11
        h3.name = "Ardo-jin Ghune"
        h3.profession = "Streuner"
        h3.rasse = "Mensch"
        h3.waffen = 16
        h3.wildnis = 20
        h3.wissen = 13
        h3.wunder = 0
        
        // Held Maya Marbosso, Streunerin
        let h4 = heldenModel.createHeld();
        h4.astral = 0
        h4.athletik = 13
        h4.charisman = 14
        h4.fingerfertigkeit = 13
        h4.gesellschaft = 20
        h4.geschlecht = 0
        h4.gewandheit = 14
        h4.handwerk = 0
        h4.heimlichkeit = 15
        h4.intuition = 15
        h4.karma = 0
        h4.klugheit = 18
        h4.kultur = "Mittellaender"
        h4.koerperkraft = 11
        h4.leben = 30
        h4.magie = 0
        h4.medizin = 0
        h4.mut = 14
        h4.name = "Maya Marbosso"
        h4.profession = "Streuner"
        h4.rasse = "Mensch"
        h4.waffen = 12
        h4.wildnis = 10
        h4.wissen = 18
        h4.wunder = 0
        
        // Ausgabe der Dummy Helden aus der Core Data
        //print("Helden:")
        //print(heldenModel.helden);
    }

}

