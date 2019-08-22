//
//  CharacterViewDelegate.swift
//  RickAndMortyMVP
//
//  Created by Ramón Seoane Martín on 22/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import Foundation

protocol CharacterViewDelegate: NSObjectProtocol {
    func displayCharacters ( pagedInfo: PagedInfoCharacter)
}

class CharacterPresenter {
    
    private var characterService: PagedInfoController
    
    weak private var characterViewDelegate: CharacterViewDelegate?
    
    init(characterService: PagedInfoController) {
        self.characterService = characterService
    }
    
    func setViewDelegate ( characterViewDelegate: CharacterViewDelegate) {
        self.characterViewDelegate = characterViewDelegate
    }
    
    func loadCharacters() {
        characterService.fetchCharacterInfoWithAlamofire(url: nil) { [weak self] (pagedInfo) in
            if let pagedInfo = pagedInfo{
                self?.characterViewDelegate?.displayCharacters(pagedInfo: pagedInfo)
            }
        }
    }
}
