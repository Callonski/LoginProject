//
//  avatarPicker.swift
//  LoginFirebase
//
//  Created by Calle Engene on 2017-09-29.
//  Copyright © 2017 Calle Engene. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @objc func handleSelectProfileImageView() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    
    }
    func saveData(uid: String, email: String, userName: String) {
        var ref: DatabaseReference!
        ref = Database.database().reference()
        let storageRef = Storage.storage().reference().child(uid)
        if let uploadData = UIImagePNGRepresentation(avatarImage.image!) {
            storageRef.putData(uploadData, metadata: nil, completion:
                { (metaData, error) in
                
                    if (error != nil){
                        print("Ohoo det blev vist ett Error!!")
                        return
                    }
                    //To retreive the imageURL
                    if let profileImageUrl = metaData?.downloadURL()?.absoluteString {
                        let values = ["name":userName, "email":email, "imageURL":profileImageUrl]
                        ref.child("users").child(uid).setValue(values)
                    }
            })
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("OH no, No picture was chosen!")
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var selectedImageFromPicker: UIImage?
        
        if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            selectedImageFromPicker = editedImage
        }else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage{
            selectedImageFromPicker = originalImage
        }
        if let selectedImage = selectedImageFromPicker {
            avatarImage.image = selectedImage
        }
        dismiss(animated: true, completion: nil)

    }
    
    @IBAction func signUp(_ sender: Any) {

        Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
            if let uid = Auth.auth().currentUser?.uid {
            self.saveData(uid: uid, email: self.email.text!, userName: self.usernameTextfield.text!)
            self.dismiss(animated: true, completion: nil)
            if(self.usernameTextfield.text != nil){
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = self.usernameTextfield.text
                changeRequest?.commitChanges { (error) in
                }
            }
            }
         //   Auth.auth().currentUser?.sendEmailVerification { (error) in
        //      print("Please Verify your email before you loggin")
       //    }
        }
    }
}
