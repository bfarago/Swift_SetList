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
                TextField("Title", text: Binding(
                    get: { song.stitle ?? "" },
                    set: { song.stitle = $0 }
                ))
                TextField("Artist", text: Binding(
                    get: { song.artist ?? "" },
                    set: { song.artist = $0 }
                ))
                TextField("BPM", value: Binding(
                    get: { Int(song.bpm) },
                    set: { song.bpm = Int16($0) }
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
        .navigationTitle(song.stitle ?? "Unknown Song")
        .navigationBarTitleDisplayMode(.inline)
    
    }
}
