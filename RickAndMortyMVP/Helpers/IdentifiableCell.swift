//
//  IdentifiableCell.swift
//  RickAndMorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit
import Foundation

protocol IdentifiableCell {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

extension IdentifiableCell {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
}
