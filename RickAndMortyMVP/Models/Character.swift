//
//  Character.swift
//  RickAndMorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//
import UIKit
import Foundation

struct Character: Codable, Equatable {
    var id: Int?
    var name: String
    var species: String?
    var gender: String?
    var status: statusType?
    var photo: String?
    var location: Location?
    var origin: Location?
    
    enum statusType: String, Codable {
        case Alive
        case Dead
        case Unknown = "unknown"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case species
        case gender
        case status
        case photo = "image"
        case location
        case origin
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        species = try container.decodeIfPresent(String.self, forKey: .species)
        gender = try container.decodeIfPresent(String.self, forKey: .gender)
        status = try container.decodeIfPresent(statusType.self, forKey: .status)
        photo = try container.decodeIfPresent(String.self, forKey: .photo)
        location = try container.decodeIfPresent(Location.self, forKey: .location)
        origin = try container.decodeIfPresent(Location.self, forKey: .origin)
    }
    
    static func ==(lhs: Character, rhs: Character) -> Bool {
        return lhs.id == rhs.id
    }
}
