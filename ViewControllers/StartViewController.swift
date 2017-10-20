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



class StartViewController: UIViewController,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    var pets = [Pet]()
    let photo1 = UIImage(named: "pet1")
    var ref: DatabaseReference!
    var myArray:[String:String] = [:]
    var myNumber = 1
    var petSelected = 0

    
    
    
    func loadPets() {
       let pet1 = Pet(name: "Uma Gurman", breed: "DSG", gender: "Female", image: photo1! )
        pets += [pet1]
         pets += [pet1]
         pets += [pet1]
         pets += [pet1]
    }
  
    @IBAction func profile(_ sender: Any) {
        performSegue(withIdentifier: "showProfile", sender: nil)
    }
    
   
   
    override func viewWillAppear(_ animated: Bool) {
        if(Auth.auth().currentUser == nil){
            performSegue(withIdentifier: "login", sender: nil)

        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPet" {
            if let viewController = segue.destination as? PetViewController {
                viewController.pet = petSelected
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadPets()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
