//
//  EpisodeCollectionViewController.swift
//  RickAndMorty
//
//  Created by Ramón Seoane Martín on 19/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class LocationCollectionViewController: UIViewController, LocationViewDelegate {
    func displayLocations(pagedInfo: PagedInfoLocation) {
        for episode in pagedInfo.results {
            if !self.locationArray.contains(episode) {
                self.locationArray.append(episode)
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
    var presenter = LocationPresenter(locationService: PagedInfoController())
    
    var locationArray: [Location] = []
    //var pagedInfoArray: [PagedInfo] = []
    
    let queries: [String: String] = [
        "count": "67",
        "pages": "4"
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
        presenter.setViewDelegate(locationViewDelegate: self)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        self.collectionViewInterno.backgroundView = activityIndicator
        activityIndicator.startAnimating()
        
        // CARGAMOS LOS LOCATIONS MEDIANTE EL DELEGADO
        presenter.loadLocations()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        
//        pagedInfoController.fetchLocationInfoWithAlamofire(url: nil) { (pagedInfo) in
//            if let pagedInfo = pagedInfo {
//                
//                for episode in pagedInfo.results {
//                    if !self.locationArray.contains(episode) {
//                        self.locationArray.append(episode)
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

extension LocationCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return locationArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! LocationCollectionViewCell
        
        // Configure the cell...
        let location = locationArray[indexPath.row]
        
        cell.nameLabel.text = location.name
        cell.typeLabel.text = location.type
        cell.dimensionLabel.text = location.dimension
        cell.imagen.image = UIImage(named: "planet")
        
        return cell
    }
    
    
}
