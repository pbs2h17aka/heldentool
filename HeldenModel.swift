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
    
    func createHeld() -> Held
    {
        let held =  NSEntityDescription.insertNewObject(forEntityName: "Held", into: contentView) as! Held
        return held
    }
    
    var helden : [Held] {
        let request : NSFetchRequest <Held> = Held.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let helden = try! contentView.fetch(request)
        
        return helden
    }
    
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
}

