//
//  EpisodePresenter.swift
//  RickAndMortyMVP
//
//  Created by Ramón Seoane Martín on 22/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import Foundation

protocol EpisodeViewDelegate: NSObjectProtocol {
    func displayEpisodes ( pagedInfo: PagedInfoEpisode)
}

class EpisodePresenter {
    
    private var episodeService: PagedInfoController
    
    weak private var episodeViewDelegate: EpisodeViewDelegate?
    
    init(episodeService: PagedInfoController) {
        self.episodeService = episodeService
    }
    
    func setViewDelegate ( episodeViewDelegate: EpisodeViewDelegate) {
        self.episodeViewDelegate = episodeViewDelegate
    }
    
    func loadEpisodes() {
        episodeService.fetchEpisodeInfoWithAlamofire(url: nil) { [weak self] (pagedInfo) in
            if let pagedInfo = pagedInfo{
                self?.episodeViewDelegate?.displayEpisodes(pagedInfo: pagedInfo)
            }
        }
    }
}
