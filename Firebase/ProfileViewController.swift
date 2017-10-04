//
//  ProfileViewController.swift
//  LoginFirebase
//
//  Created by Calle Engene on 2017-10-04.
//  Copyright © 2017 Calle Engene. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import Firebase
import FirebaseStorage

class ProfileViewController: UIViewController {
    
    var ref: DatabaseReference!
    var myDict:[String:String] = [:]
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userNameTextField: UILabel!
    @IBOutlet weak var emailTextField: UILabel!
    
    
    
    @IBAction func logoutButtons(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            self.dismiss(animated: true, completion: {
                self.dismiss(animated: true, completion: nil)
            }
            )

        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        self.performSegue(withIdentifier: "logout", sender: nil)

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ref = Database.database().reference()
        Auth.auth().addStateDidChangeListener { (auth, user) in

        }
        if(Auth.auth().currentUser != nil){

            let uid = Auth.auth().currentUser!.uid
            print(uid)
            ref.child("users").child(uid).observe(DataEventType.value, with: { (snapshot) in
                if (snapshot.value == nil) {
                  //  self.welcomeTextField.text = self.theMessage(message: ["":"Det sket sig"])
                }else{
                    let dict = snapshot.value as? [String:String] ?? [:]
                    self.myDict = dict
                    if let url = dict["imageURL"], let name = dict["name"], let email = dict["email"] {
                        self.userNameTextField.text = name
                        self.emailTextField.text = email
                        let newUrl = URL(string:url)
                        URLSession.shared.dataTask(with: newUrl!, completionHandler: { (data, response, error) in
                            if (error != nil){
                                print(error!)
                                return
                            }
                            DispatchQueue.main.async(execute: {() -> Void in
                                self.profileImage.image = UIImage(data: data!)

                            })

                        }).resume()
                    }
                }
            })
        }
    }


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("!!!!!!!!!!!! \(myDict["name"])")
       // self.userNameTextField.text = myDict["name"]
        //self.emailTextField.text = myDict["email"]
        // Do any additional setup after loading the view.
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
