//
//  FirebaseController.swift
//  RickAndMorty
//
//  Created by Ramón Seoane Martín on 21/08/2019.
//  Copyright © 2019 Usuario. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class FirebaseController {
    
    static func createUser(email: String, password: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
            if let e = error{
                callback?(e)
                return
            }
            Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                if error == nil {
                    callback?(nil)
                }else {
                    print(error!.localizedDescription)
                    callback?(error)
                }
            })
        }
    }
    
    static func login(withEmail email: String, password: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let e = error{
                callback?(e)
                return
            }
            callback?(nil)
        }
    }
    
    static func signOut() -> Bool{
        do{
            try Auth.auth().signOut()
            return true
        }catch{
            return false
        }
    }
    
    static func salir() {
        if FirebaseController.signOut() {
            //dismiss(animated: true, completion: nil)
            let appdelegate = UIApplication.shared.delegate as! AppDelegate
            appdelegate.window?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginController")
            appdelegate.window?.makeKeyAndVisible()
            
        }else {
            print("[ERROR]: Ha ocurrido algún error que no ha permitido el logout.")
        }
    }
    
    
    static func sendEmailVerification(_ callback: ((Error?) -> ())? = nil){
        Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
            callback?(error)
        })
    }
    
    static func reloadUser(_ callback: ((Error?) -> ())? = nil){
        Auth.auth().currentUser?.reload(completion: { (error) in
            callback?(error)
        })
    }
    
    static func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            callback?(error)
        }
    }
    
    static func createProfileChangeRequest(photoUrl: URL? = nil, name: String? = nil, _ callback: ((Error?) -> ())? = nil){
        if let request = Auth.auth().currentUser?.createProfileChangeRequest(){
            if let name = name{
                request.displayName = name
            }
            if let url = photoUrl{
                request.photoURL = url
            }
            
            request.commitChanges(completion: { (error) in
                callback?(error)
            })
        }
    }
    
    
}
