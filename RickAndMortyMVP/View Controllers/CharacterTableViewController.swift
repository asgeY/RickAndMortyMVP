//
//  CharacterTableViewController.swift
//  RickAndMorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit

class CharacterTableViewController: UITableViewController, CharacterViewDelegate {
    func displayCharacters(pagedInfo: PagedInfoCharacter) {
        for character in pagedInfo.results {
            if !self.characterArray.contains(character) {
                self.characterArray.append(character)
            }
        }
        
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.tableView.reloadData()
        }
        
    }
    
    
    
    @IBOutlet weak var barButtonLogout: UIBarButtonItem!
    
    //var pagedInfoController = PagedInfoController() --> SE CAMBIA POR EL PRESENTER
    var presenter = CharacterPresenter(characterService: PagedInfoController())
    
    var characterArray: [Character] = []
    //var pagedInfoArray: [PagedInfo] = []
    
    let queries: [String: String] = [
        "count": "394",
        "pages": "20"
    ]
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        return activityIndicator
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SETTEAMOS EL DELEGADO
        presenter.setViewDelegate(characterViewDelegate: self)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        tableView.register(CharacterTableViewCell.nib, forCellReuseIdentifier: CharacterTableViewCell.reuseIdentifier)
        
        tableView.backgroundView = activityIndicator
        activityIndicator.startAnimating()
        
        // CARGAMOS LOS CARACTERS MEDIANTE EL DELEGADO
        presenter.loadCharacters()
        
        //    pagedInfoController.fetchCharacterInfoWithAlamofire(url: nil) { (pagedInfo) in
        //        if let pagedInfo = pagedInfo {
        //
        //            for character in pagedInfo.results {
        //                if !self.characterArray.contains(character) {
        //                    self.characterArray.append(character)
        //                }
        //            }
        //
        //
        //        }
        //        DispatchQueue.main.async {
        //            self.activityIndicator.stopAnimating()
        //            self.tableView.reloadData()
        //        }
        //
        //    }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func logout(_ sender: UIBarButtonItem) {
        
        FirebaseController.salir()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return characterArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.reuseIdentifier, for: indexPath) as! CharacterTableViewCell
        
        // Configure the cell...
        let character = characterArray[indexPath.row]
        
        cell.configure(for: character)
        
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "characterDetail", sender: self)
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "characterDetail" {
            let destination = segue.destination as! CharacterDetailTableViewController
            if let selectedIndex = tableView.indexPathForSelectedRow {
                destination.character = characterArray[selectedIndex.row]
            }
        }
    }
    
}
