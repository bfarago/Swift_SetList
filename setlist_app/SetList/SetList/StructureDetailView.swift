//
//  StructureDetailView.swift
//  SetList
//
//  Created by Farago Barna on 17/06/2024.
//

import SwiftUI
import SwiftData

struct StructureDetailView: View {
    @Bindable var structure: Structure
    @Environment(\.modelContext) private var modelContext

    var body: some View {
        Form {
            Section(header: Text("Structure Details")) {
                TextField("Name", text: $structure.name)
                TextField("Bars", value: $structure.bars, formatter: NumberFormatter())
                TextField("Info", text: $structure.info)
            }
        }
        .navigationTitle(structure.name)
        .toolbar {
            ToolbarItem() {
                Button(action: saveStructure) {
                    Text("Save")
                }
            }
        }
    }

    private func saveStructure() {
        try? modelContext.save()
    }
}
