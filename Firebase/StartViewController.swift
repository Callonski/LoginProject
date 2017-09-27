//
//  StartViewController.swift
//  Firebase
//
//  Created by Calle Engene on 2017-09-22.
//  Copyright © 2017 Calle Engene. All rights reserved.

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase

class StartViewController: UIViewController {
    
    @IBOutlet weak var welcomeTextField: UILabel!
    
     @IBOutlet weak var logoutButton: UIButton!
    @IBAction func logoutButtons(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        performSegue(withIdentifier: "logout", sender: nil)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
        }
        
        if Auth.auth().currentUser == nil {
            performSegue(withIdentifier: "login", sender: nil)

        }else { welcomeTextField.text = "Welcome \(String(describing: Auth.auth().currentUser!.email!)) Verified email: \(String(describing: Auth.auth().currentUser!.isEmailVerified))"
            
        }
     
        
    }
    
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
