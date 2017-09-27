//
//  ViewController.swift
//  Firebase
//
//  Created by Calle Engene on 2017-09-22.
//  Copyright © 2017 Calle Engene. All rights reserved.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    //var ref: DatabaseReference!
    
    
    @IBAction func passwordEdit(_ sender: Any) {
        if(email.text != "" && password.text != ""){
            loginButton.isEnabled = true
        }
    }
    override func viewWillAppear(_ animated: Bool) {
//        let handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            // ...
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //ref = Database.database().reference()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }

    @IBAction func signUp(_ sender: Any) {
    }
    
    @IBAction func Login(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            
            if(error != nil){
                print("Kunde inte logga in")
            }else if (Auth.auth().currentUser!.isEmailVerified){
                self.dismiss(animated: true, completion: nil)

            }else{
                print("Please verify your email")
            }
        }
    }
    
}

