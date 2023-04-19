//
//  LocationManager.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import Foundation
import MapKit
import SwiftUI
import CoreLocation

class LocationManager: NSObject,CLLocationManagerDelegate, ObservableObject , Identifiable {
    @Published var region = MKCoordinateRegion()
    private let manager = CLLocationManager()
    
    
    override init() {
            super.init()
            manager.delegate = self
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()
        }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            locations.last.map {
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
                )
            }
        }
    
    
      
    
    
    
    
    
}

