//
//  SongListView.swift
//  SetList
//
//  Created by Farago Barna on 18/06/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct SongListView: View {
    @Environment(\.modelContext) private var modelContext

    @Query(sort: \Song.stitle, order: .forward) private var songs: [Song]

    var body: some View {
        NavigationView {
            List {
                ForEach(songs) { song in
                    NavigationLink(destination: SongDetailView(song: song)) {
                        Text(song.stitle)
                        Text(song.artist)
                    }
                }
                .onDelete(perform: deleteSongs)
            }
            .navigationTitle("Songs")
            .toolbar {
                ToolbarItem() {
                    Button(action: addSong) {
                        Label("Add Song", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addSong() {
        let newSong = Song(stitle: "New Song", artist: "Unknown Artist", bpm: 120, genre: "Unknown Genre", notes: "No Notes")
        modelContext.insert(newSong)
        try? modelContext.save()
    }

    private func deleteSongs(at offsets: IndexSet) {
        for index in offsets {
            modelContext.delete(songs[index])
        }
        try? modelContext.save()
    }
}
