//
//  PagedInfo.swift
//  RickAndMorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import Foundation

struct PagedInfoCharacter: Codable {
    
    struct Meta: Codable {
        var count: Int
        var pages: Int
        var next: String
        var prev: String
    }
    
    let info: Meta
    let results: [Character]

}
