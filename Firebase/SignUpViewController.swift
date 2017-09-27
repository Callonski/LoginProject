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
    override func viewDidLoad() {
        super.viewDidLoad()
        if(email.text == "" || password.text == "") {
        signUpButton.isEnabled = false
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func editPassword(_ sender: Any) {
         if(email.text != "" && password.text != ""){
            signUpButton.isEnabled = true
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
       
        Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
            self.dismiss(animated: true, completion: nil)

            Auth.auth().currentUser?.sendEmailVerification { (error) in
                print("Please Verify your email before you loggin")
            }
            
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
