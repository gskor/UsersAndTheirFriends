//
//  Users.swift
//  UsersAndTheirFriends
//
//  Created by Григорий Скороспелкин on 03.04.2025.
//

import Foundation
import SwiftData

@Model
class User: Codable {
    
    enum CodingKeys: String, CodingKey {
        case name
        case company
        case age
        case isActive
        case email
        case address
        case about
        case registered
        case tags
        case friends
    }
    
    var name: String
    var company: String
    var age: Int
    var isActive: Bool
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.company = try container.decode(String.self, forKey: .company)
        self.age = try container.decode(Int.self, forKey: .age)
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        self.registered = try container.decode(Date.self, forKey: .registered)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(company, forKey: .company)
        try container.encode(age, forKey: .age)
        try container.encode(isActive, forKey: .isActive)
        try container.encode(email, forKey: .email)
        try container.encode(address, forKey: .address)
        try container.encode(about, forKey: .about)
        try container.encode(registered, forKey: .registered)
        try container.encode(tags, forKey: .tags)
        try container.encode(friends, forKey: .friends)
    }
}

@Model
class Friend: Codable {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    enum CodingKeys: String, CodingKey {
        case name
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}
