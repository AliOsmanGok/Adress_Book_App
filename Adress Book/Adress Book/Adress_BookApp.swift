//
//  Adress_BookApp.swift
//  Adress Book
//
//  Created by ALİ OSMAN GÖK on 10.04.2023.
//

import SwiftUI

@main
struct AdressBookApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
