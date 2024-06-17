//
//  SongDetailView.swift
//  SetList
//
//  Created by Farago Barna on 16/06/2024.
//

import SwiftUI
import SwiftData

struct SongDetailView: View {
    @Bindable var song: Song
    var body: some View {
        Form {
            Section(header: Text("Song Details")) {
                TextField("Title", text: $song.stitle)
                TextField("Artist", text: $song.artist)
                TextField("BPM", value: Binding(
                    get: { Int(song.bpm) },
                    set: { song.bpm = Int($0) }
                ), formatter: NumberFormatter())
                TextField("Genre", text: Binding(
                    get: { song.genre ?? "" },
                    set: { song.genre = $0 }
                ))
                TextField("Notes", text: Binding(
                    get: { song.notes ?? "" },
                    set: { song.notes = $0 }
                ))
            }
/*
            Section(header: Text("Structure")) {
                List {
                    // Iterating over the song structure if it exists
                    ForEach(song.structure?.allObjects as? [Section] ?? []) { section in
                        Text("\(section.name ?? "Unknown Section") - \(section.bars) bars")
                    }
                }
            }
 */
        }
        .navigationTitle(song.stitle)
        //.navigationBarTitleDisplayMode(.inline)
    
    }
}
