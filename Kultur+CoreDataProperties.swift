//
//  Kultur+CoreDataProperties.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/14/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//
//

import Foundation
import CoreData


extension Kultur {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Kultur> {
        return NSFetchRequest<Kultur>(entityName: "Kultur")
    }

    @NSManaged public var name: String?
    @NSManaged public var mut: Int32
    @NSManaged public var klugheit: Int32
    @NSManaged public var intuition: Int32
    @NSManaged public var charisma: Int32
    @NSManaged public var fingerfertigkeit: Int32
    @NSManaged public var gewandheit: Int32
    @NSManaged public var koerperkraft: Int32

}
