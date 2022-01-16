//
//  PhoneBook+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by 김재훈 on 2022/01/15.
//
//

import Foundation
import CoreData


extension PhoneBook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PhoneBook> {
        return NSFetchRequest<PhoneBook>(entityName: "PhoneBook")
    }

    @NSManaged public var memo: String?
    @NSManaged public var personName: String?
    @NSManaged public var phoneNumber: String?
    
}

extension PhoneBook : Identifiable {

}
