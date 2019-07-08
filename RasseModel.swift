//
//  RasseModel.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/14/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import Foundation
import CoreData
import UIKit

// Klasse zur Verwaltung der Rassen in der Core Data
class RasseModel {
    
    static let item = RasseModel()
    
    private let persistentContainer : NSPersistentContainer
    private var contentView : NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    private init () {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        persistentContainer = appDelegate.persistentContainer
    }

    // Methode erstellt neuen Rasse Core Data Eintrag
    func createRasse() -> Rasse
    {
        let rasse =  NSEntityDescription.insertNewObject(forEntityName: "Rasse", into: contentView) as! Rasse
        return rasse
    }
    
    // Methode um eine Rasse aus der Core Data zu löschen
    func loeschen(rasse : Rasse)
    {
        contentView.delete(rasse)
    }
    
    // Methode um alle Rassen aus der Core Data zu löschen
    func alleRassenLoeschen()
    {
        for rasse in rassen
        {
            loeschen(rasse : rasse)
        }
    }
    
    // Methode liefert alle Rassen als [Rasse]
    var rassen : [Rasse] {
        let request : NSFetchRequest <Rasse> = Rasse.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let rassen = try! contentView.fetch(request)
        
        return rassen
    }
    
    // Methode liefert alle Rassen Namen als [String]
    var rassenNamen : [String] {
        let request : NSFetchRequest <Rasse> = Rasse.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let rassen = try! contentView.fetch(request)
        
        var namen : [String] = []
        for r in rassen {
            namen.append(r.name!)
        }
        
        return namen
    }
    
    func save() {
        //assert(Thread.isMainThread)
        do {
            try contentView.save()
        }
        catch let error {
            print("Fehler beim Speichern \(error)")
        }
    }
}
