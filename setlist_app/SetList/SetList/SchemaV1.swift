//
//  SchemaV1.swift
//  SetList
//
//  Created by Farago Barna on 18/06/2024.
//

import Foundation
import SwiftData
class SchemaV1 {
    @Model
    class Song {
        @Attribute var id: UUID
        var stitle: String
        var artist: String
        var bpm: Int
        var genre: String?
        var notes: String?
        @Relationship var structures: [Structure]
        
        init(stitle: String, artist: String, bpm: Int, genre: String, notes: String? = nil) {
            self.id = UUID()
            self.stitle = stitle
            self.artist = artist
            self.bpm = bpm
            self.genre = genre
            self.notes = notes
            self.structures = []
        }
    }
    @Model
    class Structure {
        @Attribute var id: UUID
        var name: String
        var bars: Int
        var info: String
        @Relationship var song: Song

        init(name: String, bars: Int, info: String, song: Song) {
            self.id = UUID()
            self.name = name
            self.bars = bars
            self.info = info
            self.song = song
        }
    }
}
