//
//  SetListApp.swift
//  SetList
//
//  Created by Farago Barna on 16/06/2024.
//

import SwiftUI

@main
struct SetListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                //.environment(\.modelContext, PersistenceController.shared.container.managedObjectModel)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
