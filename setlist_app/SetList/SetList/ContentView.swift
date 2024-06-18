//
//  ContentView.swift
//  SetList
//
//  Created by Farago Barna on 16/06/2024.
//

import SwiftUI
import SwiftData
import Foundation

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("SetList Editor")
                NavigationLink(destination: SongListView()) {
                    Text("Go to Song list")
                }
                NavigationLink(destination: ShareDataView()) {
                    Text("Share Data")
                }
            }
        }
    }
}
