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
}

