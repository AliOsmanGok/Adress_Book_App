//
//  ListView.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import SwiftUI

struct ListView: View {
    
    @Environment(\.managedObjectContext) var moc
    var located : Located
    @FetchRequest(sortDescriptors: []) var locadets: FetchedResults<Located>
    
    @State private var locadetss:[Located] = [Located]()
    
 
    
    var body: some View {
        
        
        List{
            ForEach(locadets, id: \.self){located in
                NavigationLink{
                    DetailsView(locatedss: located)
                }label: {
                    Text(located.hood ?? "")
                }
                
            }.onDelete(perform: deleteLocated)
            
        }
    }
    
    func deleteLocated(at offsets: IndexSet){
        for offset in offsets {
            let located = locadets[offset]
            moc.delete(located)
        }
        try? moc.save()
    }
    
    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(located: Located())
        }
    }






