//
//  Song.swift
//  SetList
//
//  Created by Farago Barna on 17/06/2024.
//
import Foundation
import SwiftData

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
