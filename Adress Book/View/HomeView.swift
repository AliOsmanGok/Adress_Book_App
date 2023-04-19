//
//  HomeView.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import SwiftUI

struct HomeView: View {
    

    var body: some View {
        VStack{
            NavigationView{
                VStack{
                    
                    List{
                        
                        
                        NavigationLink {
                            
                            ListView(located: Located())
                        } label: {
                            Text("KAYITLI ADRESLERİM");
                            
                        }
                        NavigationLink {
                            
                            CurrentView()
                        } label: {
                            Text("GÜNCEL KONUMU KAYDET");
                            
                        }
                        /*NavigationLink{
                         MappView(locatedi: MapView())
                         }label: {
                         Text("HARİTA ÜZERİNDE ADRES KAYDET")
                         }*/
                        Image("logo")
                            .resizable()
                            //.aspectRatio(contentMode: .fill)
                            //.frame(width: )
                            .frame(height: UIScreen.main.bounds.height * 0.6)
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                    }
                    
                        //
                        //
                        //
                        //.opacity(0.9)
                        //.cornerRadius(40)
                        //.overlay(RoundedRectangle(cornerRadius: 40))
                    
                }.navigationTitle(Text("Adress Book"))
                
                
            }
            
        }
       
    }
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Georgia-Bold",size:20)!, .foregroundColor: UIColor.systemBlue]
        
        //UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor .systemBlue]
    }
    
    
    struct _Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
}

