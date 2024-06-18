//
//  SetListApp.swift
//  SetList
//
//  Created by Farago Barna on 16/06/2024.
//

import SwiftUI

typealias Song = SchemaV1.Song
typealias Structure = SchemaV1.Structure

@main
struct SetListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Song.self, Structure.self])
    }
}
