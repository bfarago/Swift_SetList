//
//  Song_CoreDataProperties.swift
//  
//
//  Created by Farago Barna on 16/06/2024.
//

import Foundation
import CoreData

extension Song {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var title: String?
    @NSManaged public var artist: String?
    @NSManaged public var bpm: Int16
    @NSManaged public var genre: String?
    @NSManaged public var notes: String?
    @NSManaged public var structure: NSSet?
}

// MARK: Generated accessors for structure
extension Song {
    @objc(addStructureObject:)
    @NSManaged public func addToStructure(_ value: Section)

    @objc(removeStructureObject:)
    @NSManaged public func removeFromStructure(_ value: Section)

    @objc(addStructure:)
    @NSManaged public func addToStructure(_ values: NSSet)

    @objc(removeStructure:)
    @NSManaged public func removeFromStructure(_ values: NSSet)
}

extension Section {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Section> {
        return NSFetchRequest<Section>(entityName: "Section")
    }

    @NSManaged public var name: String?
    @NSManaged public var bars: Int16
    @NSManaged public var info: String?
    @NSManaged public var song: Song?
}
