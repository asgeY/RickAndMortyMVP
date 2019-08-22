//
//  EpisodeCollectionViewController.swift
//  RickAndMorty
//
//  Created by Ramón Seoane Martín on 19/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class EpisodeCollectionViewController: UIViewController, EpisodeViewDelegate {
    func displayEpisodes(pagedInfo: PagedInfoEpisode) {
        for episode in pagedInfo.results {
            if !self.episodeArray.contains(episode) {
                self.episodeArray.append(episode)
            }
        }
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.collectionViewInterno.reloadData()
        }
    }
    
    
    @IBOutlet weak var barButtonLogout: UIBarButtonItem!
    
    @IBOutlet weak var collectionViewInterno: UICollectionView!
    
    //var pagedInfoController = PagedInfoController() --> SE CAMBIA POR EL PRESENTER
    var presenter = EpisodePresenter(episodeService: PagedInfoController())
    
    var episodeArray: [Episode] = []
    //var pagedInfoArray: [PagedInfo] = []
    
    let queries: [String: String] = [
        "count": "31",
        "pages": "2"
    ]
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        return activityIndicator
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewInterno.delegate = self
        collectionViewInterno.dataSource = self
        
        // SETTEAMOS EL DELEGADO
        presenter.setViewDelegate(episodeViewDelegate: self)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        self.collectionViewInterno.backgroundView = activityIndicator
        activityIndicator.startAnimating()
        
        // CARGAMOS LOS EPISODES MEDIANTE EL DELEGADO
        presenter.loadEpisodes()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
//        pagedInfoController.fetchEpisodeInfoWithAlamofire(url: nil) { (pagedInfo) in
//            if let pagedInfo = pagedInfo {
//
//                for episode in pagedInfo.results {
//                    if !self.episodeArray.contains(episode) {
//                        self.episodeArray.append(episode)
//                    }
//                }
//
//                DispatchQueue.main.async {
//                    self.activityIndicator.stopAnimating()
//                    self.collectionViewInterno.reloadData()
//                }
//            }
//
//        }
    }

    @IBAction func logout(_ sender: UIBarButtonItem) {
        
        FirebaseController.salir()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

   

}

extension EpisodeCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return episodeArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! EpisodeCollectionViewCell
        
        // Configure the cell...
        let episode = episodeArray[indexPath.row]
        
        cell.episodeLabel.text = episode.episode
        cell.nameLabel.text = episode.name
        cell.airDateLabel.text = episode.air_date
        
        return cell
    }
    
    
}
