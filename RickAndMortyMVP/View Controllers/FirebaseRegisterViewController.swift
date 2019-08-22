//
//  FirebaseRegisterViewController.swift
//  RickAndMorty
//
//  Created by Ramón Seoane Martín on 20/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class FirebaseRegisterViewController: UIViewController {

    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.userTextField.text = ""
        self.passTextField.text = ""
    }
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {

        FirebaseController.login(withEmail: userTextField.text!, password: passTextField.text!, { (error) in
            if error == nil && Auth.auth().currentUser!.isEmailVerified {
                //self.performSegue(withIdentifier: "goToMainScreen", sender: nil)
                //self.performSegue(withIdentifier: "goToMainScreen", sender: nil)
                let appdelegate = UIApplication.shared.delegate as! AppDelegate
                
                appdelegate.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabController")
                appdelegate.window?.makeKeyAndVisible()
                
            }else {
                print(error?.localizedDescription as Any)
                let logInErrorAlert: UIAlertController = UIAlertController(title: "Oooops", message: "\(error?.localizedDescription ?? "Cuenta no verificada todavía")", preferredStyle: .alert)
                self.present(logInErrorAlert, animated: true, completion: nil)
                let action1 = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction) in
                    print("You've pressed default");
                }
                logInErrorAlert.addAction(action1)
            }
        })
    }
    
    @IBAction func registerButtonTapped(_ sender: UIButton) {
        FirebaseController.createUser(email: userTextField.text!, password: passTextField.text!) { (error) in
            if error == nil && Auth.auth().currentUser!.isEmailVerified {
                self.performSegue(withIdentifier: "goToMainScreen", sender: nil)
            }else {
                print(error?.localizedDescription as Any)
                let logInErrorAlert: UIAlertController = UIAlertController(title: "Oooops", message: "\(error?.localizedDescription ?? "Verifica tu cuenta con el mail recibido")", preferredStyle: .alert)
                self.present(logInErrorAlert, animated: true, completion: nil)
                let action1 = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction) in
                    print("You've pressed default");
                }
                logInErrorAlert.addAction(action1)
            }
        }
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
