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
import FirebaseStorage

class StartViewController: UIViewController {
    @IBOutlet weak var welcomeTextField: UILabel!
    @IBOutlet weak var textFieldToSave: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    var ref: DatabaseReference!
    var myArray:[String:String] = [:]
    var myNumber = 1

    @IBAction func profile(_ sender: Any) {
        performSegue(withIdentifier: "showProfile", sender: nil)
    }
    
    @IBAction func saveButton(_ sender: Any) {
        self.ref.child("users").child((Auth.auth().currentUser!.uid)).setValue(myArray)
        textFieldToSave.text = ""
    }
   
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser == nil){
            performSegue(withIdentifier: "login", sender: nil)

        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
