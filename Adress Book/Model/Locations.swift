//
//  Locations.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import Foundation
import SwiftUI
import CoreLocation

struct Locations : Identifiable{
    let id = UUID()
    var hood : String
    var comment : String
    var coordinat : Coordinat
    
    var coordinatlocation : CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: coordinat.latitude, longitude: coordinat.longitude)
    }
}

struct Coordinat {
    var latitude : Double
    var longitude : Double
}

let konya = Locations(hood: "Konya", comment: "Bosna Hersek Mahallesi Battalgaiz Sokak Eskon Sitesi 14/1   Selçuklu / KONYA", coordinat: Coordinat(latitude: 38.01233, longitude: 32.52556))
let aksehir = Locations(hood: "Akşehir", comment: "Karabulut köyü", coordinat: Coordinat(latitude: 38.40958, longitude: 31.46532))

var locationDizisi = [konya,aksehir]

