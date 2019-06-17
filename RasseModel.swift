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

    func createRasse() -> Rasse
    {
        let rasse =  NSEntityDescription.insertNewObject(forEntityName: "Rasse", into: contentView) as! Rasse
        return rasse
    }
    
    var rassen : [Rasse] {
        let request : NSFetchRequest <Rasse> = Rasse.fetchRequest()
        
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let rassen = try! contentView.fetch(request)
        
        return rassen
    }
}
