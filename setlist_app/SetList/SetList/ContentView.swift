//
//  ContentView.swift
//  SetList
//
//  Created by Farago Barna on 16/06/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Song.stitle, ascending: true)],
        animation: .default)
    private var songs: FetchedResults<Song>

    var body: some View {
        NavigationView {
            List {
                ForEach(songs) { song in
                    NavigationLink(destination: SongDetailView(song: song) ) {
                        Text(song.stitle ?? "Unknown Title")
                    }
                }
                .onDelete(perform: deleteSongs)
            }
            .navigationTitle("Songs")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: addSong) {
                        Label("Add Song", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func addSong() {
        withAnimation {
            let newSong = Song(context: viewContext)
            newSong.stitle = "New Song"
            newSong.artist = "Unknown Artist"
            newSong.bpm = 120
            newSong.genre = "Unknown Genre"
            newSong.notes = "No Notes"

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteSongs(offsets: IndexSet) {
        withAnimation {
            offsets.map { songs[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
/*
#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
*/
