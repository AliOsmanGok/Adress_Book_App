//
//  DetailsView.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct DetailsView: View {
    public var locatedss: Located
    
    var body: some View {
        
        let enlem = locatedss.latitude
        let boylam = locatedss.longitude

        VStack{
            Text(locatedss.hood ?? "")
                .font(.title)
                .bold()
                .fontWeight(.thin)
                .foregroundColor(Color.black)
            
                .multilineTextAlignment(.leading)
            Text(locatedss.comment ?? "")
                .multilineTextAlignment(.leading)
        }.offset(y: UIScreen.main.bounds.height * -0.30)
        VStack{
            Text("Enlem: \(enlem)")
            Text("Boylam: \(boylam)")
        }.offset(y: UIScreen.main.bounds.height * -0.20)
        VStack{
            HStack{
                Button(action: {
                
                    print(enlem,boylam)
                    let rotaLocation = CLLocation(latitude: locatedss.latitude, longitude: locatedss.longitude)
                    
                    CLGeocoder().reverseGeocodeLocation(rotaLocation) { placemarks, error in
                        if let placemark = placemarks{
                            if placemark.count > 0 {
                                
                                let newPlacemark = MKPlacemark(placemark: placemark[0])
                                let item = MKMapItem(placemark: newPlacemark)
                                item.name = self.locatedss.hood
                                let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                                item.openInMaps(launchOptions:launchOptions)
                                
                            }
                        }
                    }
                    
                }) {
                    HStack {
                        Image(systemName: "car")
                            //.font(.title)
                        Text("Rota Oluştur")
                            //.fontWeight(.semibold)
                            //.font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                }
                /*
           
                Button(action: {
                    print("MESAJ GÖNDERME")
                    
                }) {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                            //.font(.title)
                        Text("Paylaş")
                            //.fontWeight(.semibold)
                            //.font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                }*/
      
        }.offset(y: UIScreen.main.bounds.height * -0.10)
        }
        
    }
}
    
    
    struct DetailsView_Previews: PreviewProvider {
        static var previews: some View {
            DetailsView(locatedss: Located())
        }
    }

/*
 Button("Rota Oluştur"){
     print(enlem,boylam)
     let rotaLocation = CLLocation(latitude: locatedss.latitude, longitude: locatedss.longitude)
     
     CLGeocoder().reverseGeocodeLocation(rotaLocation) { placemarks, error in
         if let placemark = placemarks{
             if placemark.count > 0 {
                 
                 let newPlacemark = MKPlacemark(placemark: placemark[0])
                 let item = MKMapItem(placemark: newPlacemark)
                 item.name = self.locatedss.hood
                 let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
                 item.openInMaps(launchOptions:launchOptions)
                 
             }
         }
     }
 }
 
 
 
 
 
 
 */
