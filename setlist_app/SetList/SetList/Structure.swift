//
//  Structure.swift
//  SetList
//
//  Created by Farago Barna on 17/06/2024.
//

import Foundation
import SwiftData

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
