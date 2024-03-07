//
//  Person.swift
//  Empower-THP
//
//  Created by Sophia Gorgonio on 3/7/24.
//

import Foundation

struct Person: Codable {
    var lastName: String?
    var firstName: String?
    var designationCode: String?
    var beneType: String?
    var socialSecurityNumber: String?
    var dateOfBirth: String?
    var middleName: String?
    var phoneNumber: String?
    var beneficiaryAddress: Address?
}

struct Address: Codable {
    var firstLineMailing: String?
    var scndLineMailing: String?
    var city: String?
    var zipCode: String?
    var stateCode: String?
    var country: String?
}
