//
//  SharedItem.swift
//  heldentool
//
//  Created by Christian Karrasch / PBS2H17A on 6/28/19.
//  Copyright © 2019 Christian Karrasch / PBS2H17A. All rights reserved.
//

import Foundation
class SharedItem {
    
    let heldenModel = HeldenModel.item
    
    var leben: Int32
    var magie: Int32
    var karma: Int32
    var name: String
    var rasse: String
    var kultur: String
    var profession: String
    var mut: Int32
    var klugheit: Int32
    var intuition: Int32
    var charisma: Int32
    var fingerfertigkeit: Int32
    var gewandheit: Int32
    var koerperkraft: Int32
    var waffen: Int32
    var astral: Int32
    var wunder: Int32
    var gesellschaft: Int32
    var wissen: Int32
    var handwerk: Int32
    var medizin: Int32
    var wildnis: Int32
    var heimlichkeit: Int32
    var athletik: Int32
    var geschlecht: Int32
    
    
    static let meinHeld = SharedItem()
    
    private init (  ) {
        leben = 0
        magie = 0
        karma = 0
        name = ""
        rasse = ""
        kultur = ""
        profession = ""
        mut = 0
        klugheit = 0
        intuition = 0
        charisma = 0
        fingerfertigkeit = 0
        gewandheit = 0
        koerperkraft = 0
        waffen = 0
        astral = 0
        wunder = 0
        gesellschaft = 0
        wissen = 0
        handwerk = 0
        medizin = 0
        wildnis = 0
        heimlichkeit = 0
        athletik = 0
        geschlecht = 0
    }
    
    // Methode gibt dem Helden Rassenboni
    public func addRasse(rasse : Rasse) {
        self.rasse = rasse.name!
        self.mut += rasse.mut
        self.klugheit += rasse.klugheit
        self.intuition += rasse.intuition
        self.charisma += rasse.charisma
        self.fingerfertigkeit += rasse.fingerfertigkeit
        self.gewandheit += rasse.gewandheit
        self.koerperkraft += rasse.koerperkraft
    }
    
    // Methode gibt dem Helden Kulturboni
    public func addKultur(kultur : Kultur) {
        self.kultur = kultur.name!
        self.waffen += kultur.waffen
        self.magie += kultur.magie
        self.wunder += kultur.wunder
        self.gesellschaft += kultur.gesellschaft
        self.wissen += kultur.wissen
        self.handwerk += kultur.handwerk
        self.medizin += kultur.medizin
        self.wildnis += kultur.wildnis
        self.heimlichkeit += kultur.heimlichkeit
        self.athletik += kultur.athletik
    }
    
    // Methode gibt dem Helden Professionsboni
    public func addProfession(profession : Profession) {
        self.profession = profession.name!
        self.waffen += profession.waffen
        self.magie += profession.magie
        self.wunder += profession.wunder
        self.gesellschaft += profession.gesellschaft
        self.wissen += profession.wissen
        self.handwerk += profession.handwerk
        self.medizin += profession.medizin
        self.wildnis += profession.wildnis
        self.heimlichkeit += profession.heimlichkeit
        self.athletik += profession.athletik
    }
    
    // Methode speichert neuen Helden in der Core Data
    public func speicherHelden() {
        // neuen Helden anlegen und in Core Data speichern
        let h = heldenModel.createHeld();
        h.astral = self.astral
        h.athletik = self.athletik
        h.charisma = self.charisma
        h.fingerfertigkeit = self.fingerfertigkeit
        h.gesellschaft = self.gesellschaft
        h.geschlecht = self.geschlecht
        h.gewandheit = self.gewandheit
        h.handwerk = self.handwerk
        h.heimlichkeit = self.heimlichkeit
        h.intuition = self.intuition
        h.karma = self.karma
        h.klugheit = self.klugheit
        h.kultur = self.kultur
        h.leben = self.leben
        h.magie = self.magie
        h.medizin = self.medizin
        h.mut = self.mut
        h.name = self.name
        h.profession = self.profession
        h.rasse = self.rasse
        h.waffen = self.waffen
        h.wildnis = self.wildnis
        h.wissen = self.wissen
        h.wunder = self.wunder
        
        // Zurücksetzten der Heldenwerte
        self.neuerHeldenbogen()
    }
    
    // Methode setzt die Werte des Helden zurück
    // bei Abbrechen der Heldenerschaffung oder
    // nach Speichern des Helden in der Core Data
    public func neuerHeldenbogen() {
        leben = 0
        magie = 0
        karma = 0
        name = ""
        rasse = ""
        kultur = ""
        profession = ""
        mut = 0
        klugheit = 0
        intuition = 0
        charisma = 0
        fingerfertigkeit = 0
        gewandheit = 0
        koerperkraft = 0
        waffen = 0
        astral = 0
        wunder = 0
        gesellschaft = 0
        wissen = 0
        handwerk = 0
        medizin = 0
        wildnis = 0
        heimlichkeit = 0
        athletik = 0
        geschlecht = 0
    }
}
