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
    
    func createProfession() -> Profession
    {
        let profession =  NSEntityDescription.insertNewObject(forEntityName: "Profession", into: contentView) as! Profession
        return profession
    }
    
    var professionen : [Profession] {
        let request : NSFetchRequest <Profession> = Profession.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let professionen = try! contentView.fetch(request)
        
        return professionen
    }
    
    
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
}
