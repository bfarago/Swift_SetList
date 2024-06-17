//
//  SetListApp.swift
//  SetList
//
//  Created by Farago Barna on 16/06/2024.
//

import SwiftUI

@main
struct SetListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Song.self, Structure.self])
    }
}
