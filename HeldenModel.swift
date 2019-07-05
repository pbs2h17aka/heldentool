//
//  HeldenModel.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/28/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import Foundation
import CoreData
import UIKit

// Klasse zur Verwaltung der Helden in der Core Data
class HeldenModel {
    
    static let item = HeldenModel()
    
    private let persistentContainer : NSPersistentContainer
    private var contentView : NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    private init () {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        persistentContainer = appDelegate.persistentContainer
    }
    
    // Methode erstellt neuen Held Core Data Eintrag
    func createHeld() -> Held
    {
        let held =  NSEntityDescription.insertNewObject(forEntityName: "Held", into: contentView) as! Held
        return held
    }
    
    // Methode liefert alle Helden als [Held]
    var helden : [Held] {
        let request : NSFetchRequest <Held> = Held.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let helden = try! contentView.fetch(request)
        
        return helden
    }
    
    // Methode liefert alle Helden Namen als [String]
    var heldenNamen : [String] {
        let request : NSFetchRequest <Held> = Held.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let helden = try! contentView.fetch(request)
        
        var namen : [String] = []
        for h in helden {
            namen.append(h.name!)
        }
        
        return namen
    }
    
    // Methode um einen Helden zu löschen
    func loescheHeld(held:Held)
    {
        contentView.delete(held)
    }
    
    // Methode liefert den Held mit Namen ...
    func getHeld(name:String) -> [Held] {
        let request : NSFetchRequest <Held> = Held.fetchRequest()
        
        let predicate = NSPredicate(format: "name == %@", name)
        request.predicate=predicate
        
        let held = try! contentView.fetch(request)
        return held
    }
    
    // Methode um Helden an den Server zu senden
    func sendeHelden()
    {
        // Anlegen eines Dictionarys, welcher den Held durch Schhlüssel - Wert Kombinationen dartstellt
        let heldenbogen: [String: String] = [   "leben" : String(SharedItem.meinHeld.leben),
                                                "magie" : String(SharedItem.meinHeld.magie),
                                                "karma" : String(SharedItem.meinHeld.karma),
                                                "name" : SharedItem.meinHeld.name,
                                                "rasse" : SharedItem.meinHeld.rasse,
                                                "kultur" : SharedItem.meinHeld.kultur,
                                                "profession" : SharedItem.meinHeld.profession,
                                                "mut" : String(SharedItem.meinHeld.mut),
                                                "klugheit" : String(SharedItem.meinHeld.klugheit),
                                                "intuition" : String(SharedItem.meinHeld.intuition),
                                                "charisma" : String(SharedItem.meinHeld.charisma),
                                                "fingerfertigkeit" : String(SharedItem.meinHeld.fingerfertigkeit),
                                                "gewandheit" : String(SharedItem.meinHeld.gewandheit),
                                                "koerperkraft" : String(SharedItem.meinHeld.koerperkraft),
                                                "waffen" : String(SharedItem.meinHeld.waffen),
                                                "astral" : String(SharedItem.meinHeld.astral),
                                                "wunder" : String(SharedItem.meinHeld.wunder),
                                                "gesellschaft" : String(SharedItem.meinHeld.gesellschaft),
                                                "wissen" : String(SharedItem.meinHeld.wissen),
                                                "handwerk" : String(SharedItem.meinHeld.handwerk),
                                                "medizin" : String(SharedItem.meinHeld.medizin),
                                                "wildnis" : String(SharedItem.meinHeld.wildnis),
                                                "heimlichkeit" : String(SharedItem.meinHeld.heimlichkeit),
                                                "athletik" : String(SharedItem.meinHeld.athletik),
                                                "geschlecht" : String(SharedItem.meinHeld.geschlecht)
                                            ]
        
        // debug
        print(heldenbogen)
        
        // Festlegen der URL des Servers auf dem der HEld gespeichert werden soll
        // Website an die JSONs zu Testzwecken gesendet werden https://webhook.site
        // URL muss angepasst werden, da bei jeder Sitzung neu generiert wird
        let url = URL(string: "https://webhook.site/cd514ba9-c873-43d0-a8f5-1dfbee72ca38")!
        
        // Erstellen einer Session
        let session = URLSession.shared
        
        // Erstellen einer Request auf die URL
        var request = URLRequest(url: url)
        // Setzen des Request Types auf POST
        request.httpMethod = "POST"
        
        do {
            // Umwandlung des Heldenbogens in NSDATA und Einfügen in Request Body
            request.httpBody = try JSONSerialization.data(withJSONObject: heldenbogen, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //  Erstellen eines Tasks um Request auszuführen
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                // Erstellen eines JSON aus den NSDATA
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
    }
}

