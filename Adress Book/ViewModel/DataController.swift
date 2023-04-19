//
//  DataController.swift
//  AdressBook
//
//  Created by ALİ OSMAN GÖK on 12.03.2023.
//

import Foundation
import CoreData
import SwiftUI
class DataController: ObservableObject{
  
    public let container = NSPersistentContainer(name: "AdressBook")
    init() {
        container.loadPersistentStores{ description, error in
            if let error = error {
                fatalError("Core data failed to load: \(error.localizedDescription)")
            }
        }
    }
    func getAllMovies() ->[Located]{
        let fetchRequest: NSFetchRequest<Located> = Located.fetchRequest()
        
        do{
            return try container.viewContext.fetch(fetchRequest)
        }catch{
            return[]
        }
    }
    func deleteLocated(located: Located){
        container.viewContext.delete(located)
        
        do{
            try container.viewContext.save()
        }catch{
            container.viewContext.rollback()
            print("Failed to save content\(error)")
        }
    }
}
