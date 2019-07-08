//
//  ProfessionModel.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/27/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import Foundation
import CoreData
import UIKit

// Klasse zur Verwaltung der Professionen in der Core Data
class ProfessionModel {
    
    static let item = ProfessionModel()
    
    private let persistentContainer : NSPersistentContainer
    private var contentView : NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    private init () {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        persistentContainer = appDelegate.persistentContainer
    }
    
    // Methode erstellt neuen Profession Core Data Eintrag
    func createProfession() -> Profession
    {
        let profession =  NSEntityDescription.insertNewObject(forEntityName: "Profession", into: contentView) as! Profession
        return profession
    }
    
    // Methode um eine Profession aus der Core Data zu löschen
    func loeschen(profession : Profession)
    {
        contentView.delete(profession)
    }
    
    // Methode um alle Kulturen aus der Core Data zu löschen
    func alleProfessionenLoeschen()
    {
        for profession in professionen
        {
            loeschen(profession : profession)
        }
    }
    
    // Methode liefert alle Professionen als [Profession]
    var professionen : [Profession] {
        let request : NSFetchRequest <Profession> = Profession.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let professionen = try! contentView.fetch(request)
        
        return professionen
    }
    
    // Methode liefert alls Profession Namen als [String]
    var professionenNamen : [String] {
        let request : NSFetchRequest <Profession> = Profession.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let profession = try! contentView.fetch(request)
        
        var namen : [String] = []
        for p in profession {
            namen.append(p.name!)
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
