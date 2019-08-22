//
//  LocationPresenter.swift
//  RickAndMortyMVP
//
//  Created by Ramón Seoane Martín on 22/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import Foundation

protocol LocationViewDelegate: NSObjectProtocol {
    func displayLocations ( pagedInfo: PagedInfoLocation)
}

class LocationPresenter {
    
    private var locationService: PagedInfoController
    
    weak private var locationViewDelegate: LocationViewDelegate?
    
    init(locationService: PagedInfoController) {
        self.locationService = locationService
    }
    
    func setViewDelegate ( locationViewDelegate: LocationViewDelegate) {
        self.locationViewDelegate = locationViewDelegate
    }
    
    func loadLocations() {
        locationService.fetchLocationInfoWithAlamofire(url: nil) { [weak self] (pagedInfo) in
            if let pagedInfo = pagedInfo{
                self?.locationViewDelegate?.displayLocations(pagedInfo: pagedInfo)
            }
        }
    }
}
