//
//  Episode.swift
//  RickAndMorty
//
//  Created by Ramón Seoane Martín on 19/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import Foundation

struct Episode: Codable, Equatable {
    var id: Int?
    var name: String
    var air_date: String?
    var episode: String?
    var characters: [String]?
    var url: String?  // Se transforma con el decode a URL
    var created: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case air_date
        case episode
        case characters
        case url
        case created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        air_date = try container.decodeIfPresent(String.self, forKey: .air_date)
        episode = try container.decodeIfPresent(String.self, forKey: .episode)
        characters = try container.decodeIfPresent([String].self, forKey: .characters)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        created = try container.decodeIfPresent(String.self, forKey: .created)
    }
    
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.id == rhs.id
    }
}
