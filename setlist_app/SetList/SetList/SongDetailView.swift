//
//  SongDetailView.swift
//  SetList
//
//  Created by Farago Barna on 16/06/2024.
//

import SwiftUI
import CoreData

struct SongDetailView: View {
    @ObservedObject var song: Song

    var body: some View {
        Form {
            Section(header: Text("Song Details")) {
                TextField("Title", text: Binding($song.title, "Unknown Title"))
                TextField("Artist", text: Binding($song.artist, "Unknown Artist"))
                TextField("BPM", value: Binding($song.bpm, 120), formatter: NumberFormatter())
                TextField("Genre", text: Binding($song.genre, "Unknown Genre"))
                TextField("Notes", text: Binding($song.notes, "No Notes"))
            }

            Section(header: Text("Structure")) {
                List {
                    // Iterating over the song structure if it exists
                    ForEach(song.structure?.allObjects as? [Section] ?? []) { section in
                        Text("\(section.name ?? "Unknown Section") - \(section.bars) bars")
                    }
                }
            }
        }
        .navigationTitle(song.title ?? "Unknown Song")
        .navigationBarTitleDisplayMode(.inline)
    }
}
