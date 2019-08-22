//
//  PagedInfoController.swift
//  RickAndMorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit
import Alamofire

class PagedInfoController: UITableViewController {
    
    func fetchCharacterInfoWithAlamofire(url: String?, completion: @escaping (PagedInfoCharacter?) -> Void) {
        let baseURL = URL(string: "https://rickandmortyapi.com/api/character/")!
        
        //let queries = "?page=\(numPage)"
        //let url = baseURL.withQueries(queries)!
        
        let jsonDecoder = JSONDecoder()
        
        // Alamofire cambia en la version 5 de "Alamofire.request(...." a "AF.request(...."
        AF.request(baseURL)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData{ (response) in
                
                switch response.result {
                case .success(_):
                    if let data = response.data {
                        do {
                            let pagedInfo = try jsonDecoder.decode(PagedInfoCharacter.self, from: data)
                            completion(pagedInfo)
                        } catch let error {
                            print(error)
                        }
                    }else {
                        completion(nil)
                    }
                    print("")
                case .failure(_):
                    completion(nil)
                    print("")
                }//end switch
                
        }
    }//end fetchPhotosInfoWithAlamofire()
    
    
    func fetchEpisodeInfoWithAlamofire(url: String?, completion: @escaping (PagedInfoEpisode?) -> Void) {
        let baseURL = URL(string: "https://rickandmortyapi.com/api/episode/")!
        
        
        //let queries = "?page=\(numPage)"
        
        //let url = baseURL.withQueries(queries)!
        
        let jsonDecoder = JSONDecoder()
        
        
        // Alamofire cambia en la version 5 de "Alamofire.request(...." a "AF.request(...."
        AF.request(baseURL)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData{ (response) in
                
                switch response.result {
                case .success(_):
                    if let data = response.data {
                        let pagedInfo = try? jsonDecoder.decode(PagedInfoEpisode.self, from: data)
                        completion(pagedInfo)
                    }else {
                        completion(nil)
                    }
                    print("")
                case .failure(_):
                    completion(nil)
                    print("")
                }//end switch
                
        }
    }//end fetchPhotosInfoWithAlamofire()
    
    func fetchLocationInfoWithAlamofire(url: String?, completion: @escaping (PagedInfoLocation?) -> Void) {
        let baseURL = URL(string: "https://rickandmortyapi.com/api/location/")!
        
        
        //let queries = "?page=\(numPage)"
        
        //let url = baseURL.withQueries(queries)!
        
        let jsonDecoder = JSONDecoder()
        
        
        // Alamofire cambia en la version 5 de "Alamofire.request(...." a "AF.request(...."
        AF.request(baseURL)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData{ (response) in
                
                switch response.result {
                case .success(_):
                    if let data = response.data {
                        let pagedInfo = try? jsonDecoder.decode(PagedInfoLocation.self, from: data)
                        completion(pagedInfo)
                    }else {
                        completion(nil)
                    }
                    print("")
                case .failure(_):
                    completion(nil)
                    print("")
                }//end switch
                
        }
    }//end fetchPhotosInfoWithAlamofire()
    
}
