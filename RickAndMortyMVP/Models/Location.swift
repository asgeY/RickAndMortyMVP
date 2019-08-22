//
//  Location.swift
//  RickAndMorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import Foundation

struct Location: Codable, Equatable {
    var id: Int?
    var name: String
    var type: String?
    var dimension: String?
    var residents: [String]?
    var url: String?  // Se transforma con el decode a URL
    var created: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case type
        case dimension
        case residents
        case url
        case created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        type = try container.decodeIfPresent(String.self, forKey: .type)
        dimension = try container.decodeIfPresent(String.self, forKey: .dimension)
        residents = try container.decodeIfPresent([String].self, forKey: .residents)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        created = try container.decodeIfPresent(String.self, forKey: .created)
    }
    
    static func ==(lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }


}
