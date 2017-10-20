//
//  SignUpViewController.swift
//  Firebase
//
//  Created by Calle Engene on 2017-09-22.
//  Copyright © 2017 Calle Engene. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailRegistered: UILabel!
    @IBOutlet weak var userNameTaken: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var usernameTextfield: UITextField!
    var ref: DatabaseReference = Database.database().reference()
    
    @IBAction func editUsername(_ sender: Any) {
        self.userNameTaken.isHidden = true
        // Query Firebase for UserName
        ref.child("users").queryOrdered(byChild: "name").queryEqual(toValue: usernameTextfield.text).observeSingleEvent(of: .value, with: { dataSnapshot in
            for item in dataSnapshot.children.allObjects as! [DataSnapshot] {
                print(item)
                self.userNameTaken.isHidden = false
            }
            self.editPassword(self)

        })
    }
    
    
    @IBAction func editEmail(_ sender: Any) {
        self.emailRegistered.isHidden = true
        // Query Firebase for Email
        ref.child("users").queryOrdered(byChild: "email").queryEqual(toValue: email.text).observeSingleEvent(of: .value, with: { dataSnapshot in
            for item in dataSnapshot.children.allObjects as! [DataSnapshot] {
                print(item)
                self.emailRegistered.isHidden = false
            }
            self.editPassword(self)

        })
       
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        emailRegistered.isHidden = true
        userNameTaken.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
         signUpButton.isEnabled = false

            avatarImage.image = UIImage(named:"userAvatar")
            avatarImage.translatesAutoresizingMaskIntoConstraints = true
            avatarImage.contentMode = .scaleAspectFill
            avatarImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
            avatarImage.isUserInteractionEnabled = true
      
       
        
        // Do any additional setup after loading the view.
    }
   // lazy var profileImageView: UIImageView
    
    
    @IBAction func editPassword(_ sender: Any) {
         if(email.text != "" && emailRegistered.isHidden && userNameTaken.isHidden && password.text != ""){
            signUpButton.isEnabled = true
         }else{
            signUpButton.isEnabled = false
        }
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
