//
//  Profession+CoreDataProperties.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/27/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//
//

import Foundation
import CoreData


extension Profession {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profession> {
        return NSFetchRequest<Profession>(entityName: "Profession")
    }

    @NSManaged public var athletik: Int32
    @NSManaged public var gesellschaft: Int32
    @NSManaged public var handwerk: Int32
    @NSManaged public var heimlichkeit: Int32
    @NSManaged public var magie: Int32
    @NSManaged public var medizin: Int32
    @NSManaged public var name: String?
    @NSManaged public var waffen: Int32
    @NSManaged public var wildnis: Int32
    @NSManaged public var wissen: Int32
    @NSManaged public var wunder: Int32

}
