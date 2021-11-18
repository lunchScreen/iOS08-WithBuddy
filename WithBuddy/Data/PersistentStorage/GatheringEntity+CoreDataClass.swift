//
//  GatheringEntity+CoreDataClass.swift
//  WithBuddy
//
//  Created by 김두연 on 2021/11/10.
//
//

import Foundation
import CoreData

@objc(GatheringEntity)
public class GatheringEntity: NSManagedObject {
    
    @NSManaged public var id: UUID
    @NSManaged public var date: Date
    @NSManaged public var purpose: [String]
    @NSManaged public var place: String?
    @NSManaged public var memo: String?
    @NSManaged public var picture: [URL]?
    @NSManaged public var buddyList: Set<BuddyEntity>
    
}

extension GatheringEntity {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<GatheringEntity> {
        return NSFetchRequest<GatheringEntity>(entityName: "GatheringEntity")
    }
    
    @objc(addBuddyListObject:)
    @NSManaged public func addToBuddyList(_ value: BuddyEntity)

    @objc(removeBuddyListObject:)
    @NSManaged public func removeFromBuddyList(_ value: BuddyEntity)

    @objc(addBuddyList:)
    @NSManaged public func addToBuddyList(_ values: NSSet)

    @objc(removeBuddyList:)
    @NSManaged public func removeFromBuddyList(_ values: NSSet)
    
}

extension GatheringEntity {
    
    convenience init(context: NSManagedObjectContext, gathering: Gathering) {
        self.init(context: context)
        self.id = gathering.id
        self.date = gathering.date
        self.place = gathering.place
        self.purpose = gathering.purpose
        self.memo = gathering.memo
        self.picture = gathering.picture
    }
    
    func toDomain() -> Gathering {
        return Gathering(id: self.id,
                         date: self.date,
                         place: self.place,
                         purpose: self.purpose,
                         buddyList: self.buddyList.map{ $0.toDomain() }.sorted(),
                         memo: self.memo,
                         picture: self.picture)
    }
}

extension GatheringEntity: Comparable {
    
    public static func < (lhs: GatheringEntity, rhs: GatheringEntity) -> Bool {
        return lhs.date < rhs.date
    }

}