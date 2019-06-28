//
//  Held+CoreDataProperties.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/28/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//
//

import Foundation
import CoreData


extension Held {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Held> {
        return NSFetchRequest<Held>(entityName: "Held")
    }

    @NSManaged public var leben: Int32
    @NSManaged public var magie: Int32
    @NSManaged public var karma: Int32
    @NSManaged public var name: String?
    @NSManaged public var rasse: String?
    @NSManaged public var kultur: String?
    @NSManaged public var profession: String?
    @NSManaged public var mut: Int32
    @NSManaged public var klugheit: Int32
    @NSManaged public var intuition: Int32
    @NSManaged public var charisman: Int32
    @NSManaged public var fingerfertigkeit: Int32
    @NSManaged public var gewandheit: Int32
    @NSManaged public var koerperkraft: Int32
    @NSManaged public var waffen: Int32
    @NSManaged public var astral: Int32
    @NSManaged public var wunder: Int32
    @NSManaged public var gesellschaft: Int32
    @NSManaged public var wissen: Int32
    @NSManaged public var handwerk: Int32
    @NSManaged public var medizin: Int32
    @NSManaged public var wildnis: Int32
    @NSManaged public var heimlichkeit: Int32
    @NSManaged public var athletik: Int32
    @NSManaged public var geschlecht: Int32

}
