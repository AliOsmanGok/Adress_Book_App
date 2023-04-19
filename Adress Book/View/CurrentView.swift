//
//  CurrentView.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI



struct CurrentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var loadets: FetchedResults<Located>
    
    @State var showingDetail = false
    @State var shood : String =  ""
    @State var scomment : String = ""
    @State var region = MKCoordinateRegion()
    @State var manager = LocationManager()
    @State var tracking : MapUserTrackingMode = .follow
    @State private var locations = [Locations]()

    
    var body: some View {
        ZStack{

         
         Map(coordinateRegion: $manager.region,
             interactionModes: MapInteractionModes.all,
             showsUserLocation: true)
         //userTrackingMode: $tracking)
         .edgesIgnoringSafeArea(.all)
        
         VStack{
             VStack{
                 TextField("Başlık giriniz", text: $shood)
                     .padding(3)
                     .padding(.leading,5)
                     .overlay(
                         RoundedRectangle(cornerRadius: 14)
                             .stroke(Color.gray, lineWidth: 2)
                     )
                     .frame(width: UIScreen.main.bounds.width * 0.8)
                 
                 
                 TextField("Açıklama giriniz", text: $scomment)
                     .padding(3)
                     .padding(.leading,5)
                     
                     .overlay(
                         RoundedRectangle(cornerRadius: 14)
                             .stroke(Color.gray, lineWidth: 2)
                     )
                     .frame(width: UIScreen.main.bounds.width * 0.8)
                 
                     
             }.ignoresSafeArea(.keyboard)
                 .offset(y: UIScreen.main.bounds.height * -0.30)
                 
         
         
         
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
             
         }.buttonStyle(.borderedProminent)
                 .offset(y: UIScreen.main.bounds.height * 0.3)
                 //.sheet(isPresented: $showingDetail) {
                  //   HomeView()
                 //}
                 .fullScreenCover(isPresented: $showingDetail, content: HomeView.init)

         }
 
         } .ignoresSafeArea(.keyboard)
         }

                         
    }
    

    struct CurrentView_Previews: PreviewProvider {
        static var previews: some View {
            CurrentView()
        }
    }
    
