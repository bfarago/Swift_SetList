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
    @Environment(\.modelContext) private var modelContext
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

            Section(header: Text("Structure")) {
                List {
                    ForEach(song.structures) { structure in
                        NavigationLink(destination: StructureDetailView(structure: structure)) {
                                                    VStack(alignment: .leading) {
                                                        Text("\(structure.name) - \(structure.bars) bars")
                                                        Text(structure.info).font(.subheadline).foregroundColor(.secondary)
                                                    }
                                                }
                    }
                    .onDelete(perform: deleteStructure)
                }
            }
            
 
        }
        .navigationTitle(song.stitle)
        .toolbar {
            ToolbarItem() {
                Button(action: addStructure) {
                    Label("Add Section", systemImage: "plus")
                }
            }
        }
    }
    private func addStructure() {
        let newStructure = Structure(name: "New Section", bars: 8, info: "No Info", song: song)
        song.structures.append(newStructure)
        try? modelContext.save()
    }

    private func deleteStructure(at offsets: IndexSet) {
        for index in offsets {
            let structure = song.structures[index]
            modelContext.delete(structure)
        }
        try? modelContext.save()
    }
}
