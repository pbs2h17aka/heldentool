//
//  KulturModel.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/27/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class KulturModel {
    
    static let item = KulturModel()
    
    private let persistentContainer : NSPersistentContainer
    private var contentView : NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    private init () {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        persistentContainer = appDelegate.persistentContainer
    }
    
    func createKultur() -> Kultur
    {
        let kultur =  NSEntityDescription.insertNewObject(forEntityName: "Kultur", into: contentView) as! Kultur
        return kultur
    }
    
    var kulturen : [Kultur] {
        let request : NSFetchRequest <Kultur> = Kultur.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let kulturen = try! contentView.fetch(request)
        
        return kulturen
    }
    
    var kulturenNamen : [String] {
        let request : NSFetchRequest <Kultur> = Kultur.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key:"name",ascending:true)
        request.sortDescriptors=[sortDescriptor]
        
        let kulturen = try! contentView.fetch(request)
        
        var namen : [String] = []
        for k in kulturen {
            namen.append(k.name!)
        }
        
        return namen
    }
}
