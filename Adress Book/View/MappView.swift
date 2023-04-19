//
//  MappView.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import SwiftUI
import MapKit
import CoreLocation

struct MappView: View {
    public var locatedi: MapView
     @Environment(\.managedObjectContext) var moc
     @FetchRequest(sortDescriptors: []) var loadets: FetchedResults<Located>
     @State private var isEditing = false
     @State var search : String = ""
     @State var shood : String =  ""
     @State var scomment : String = ""
     @State var manager = LocationManager()
     @State var region = MKCoordinateRegion()
     @State var showingDetail = false
     //@State var tracking:MapUserTrackingMode = .follow
     
    
    
    
    var body: some View {
        
        
        ZStack{
           
         Map(coordinateRegion: $manager.region,
             interactionModes: MapInteractionModes.all
         //showsUserLocation: true)
         //userTrackingMode: $tracking)
         ).edgesIgnoringSafeArea(.all)
          
         
         
         VStack{
         
         TextField("Başlık Giriniz...", text: $shood)
         .padding(.leading,5)
         //.background(Color.white)
         .overlay(
         RoundedRectangle(cornerRadius: 14)
         .stroke(Color.black, lineWidth: 1)
         
         )
         
         TextField("Açıklama giriniz...", text: $scomment)
         .padding(.leading,5)
         //.background(Color.white)
         .overlay(
         RoundedRectangle(cornerRadius: 14)
         .stroke(Color.black, lineWidth: 1)
         
         )
         
         Button("Kaydet"){
         //let newLocations = Locations(hood: shood, comment: scomment, coordinat:Coordinat(latitude: //manager.region.center.latitude, longitude: manager.region.center.longitude))
         //locationDizisi.append(newLocations)
         
         let newLocation = Located(context: moc)
         newLocation.id = UUID()
         newLocation.hood = "\(shood)"
         newLocation.comment = "\(scomment)"
             newLocation.latitude = manager.region.center.latitude
             newLocation.longitude = manager.region.center.longitude
         
         try? moc.save()
             self.showingDetail.toggle()
         }.buttonStyle(.borderedProminent).fullScreenCover(isPresented: $showingDetail, content: HomeView.init)
         
         }.frame(width: UIScreen.main.bounds.width * 0.9)
         .offset(y: UIScreen.main.bounds.height * -0.30)
         
         }.ignoresSafeArea(.keyboard)
         }
         
    }
    

    struct _Previews: PreviewProvider {
        static var previews: some View {
            MappView(locatedi: MapView())
        }
    }


