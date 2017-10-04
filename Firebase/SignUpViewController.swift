//
//  SignUpViewController.swift
//  Firebase
//
//  Created by Calle Engene on 2017-09-22.
//  Copyright © 2017 Calle Engene. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var usernameTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            avatarImage.image = UIImage(named:"userAvatar")
            avatarImage.translatesAutoresizingMaskIntoConstraints = true
            avatarImage.contentMode = .scaleAspectFill
            avatarImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSelectProfileImageView)))
            avatarImage.isUserInteractionEnabled = true
      
        if(email.text == "" || password.text == "") {
        signUpButton.isEnabled = false
        }
        // Do any additional setup after loading the view.
    }
   // lazy var profileImageView: UIImageView
    
    
    @IBAction func editPassword(_ sender: Any) {
         if(email.text != "" && password.text != ""){
            signUpButton.isEnabled = true
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
