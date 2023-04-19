//
//  MapView.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: UIViewRepresentable {
    

    var mapView = MKMapView()
    
       func makeUIView(context: Context) -> MKMapView {
          
           mapView.delegate = context.coordinator
           let longPressGesture = UILongPressGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.addAnnotation(gesture:)))
           mapView.addGestureRecognizer(longPressGesture)
           return mapView
       }
    
       func updateUIView(_ uiView: MKMapView, context: Context) {
    
       }
    
       func makeCoordinator() -> Coordinator {
           Coordinator(self)
       }
    
       class Coordinator: NSObject, MKMapViewDelegate {
           var parent: MapView
    
           init(_ parent: MapView) {
               self.parent = parent
           }
    
           @objc func addAnnotation(gesture: UILongPressGestureRecognizer) {
             
               if gesture.state == .began {
                   let touchPoint = gesture.location(in: gesture.view)
                   let touchMapCoordinate = parent.mapView.convert(touchPoint, toCoordinateFrom: parent.mapView)
    
                   let location = CLLocation(latitude: touchMapCoordinate.latitude, longitude: touchMapCoordinate.longitude)
                   
                   let geocoder = CLGeocoder()
                   geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
                       guard let placemark = placemarks?.first else { return }
                       let annotation = MKPointAnnotation()
                       annotation.coordinate = touchMapCoordinate
                       annotation.title = placemark.locality ?? ""
                       self.parent.mapView.addAnnotation(annotation)
                       let lati = location.coordinate.latitude
                       let longi = location.coordinate.longitude
                       print("\(lati)")
                       print("\(longi)")

                       
                   }
               }
           }

    
           func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
               let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: nil)
               annotationView.canShowCallout = true
               return annotationView
           }
       }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

