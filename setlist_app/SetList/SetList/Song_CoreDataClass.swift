//
//  Song_CoreDataClass.swift
//  
//
//  Created by Farago Barna on 16/06/2024.
//
import Foundation
import CoreData

@objc(Song)
public class Song: NSManagedObject, Identifiable {
    @NSManaged public var title: String?
    @NSManaged public var artist: String?
    @NSManaged public var bpm: Int16
    @NSManaged public var genre: String?
    @NSManaged public var notes: String?
    @NSManaged public var structure: NSSet?
}

@objc(Section)
public class Section: NSManagedObject, Identifiable {
    @NSManaged public var name: String?
    @NSManaged public var bars: Int16
    @NSManaged public var info: String?
    @NSManaged public var song: Song?
}
