//
//  PetViewController.swift
//  LoginFirebase
//
//  Created by Calle Engene on 2017-10-20.
//  Copyright © 2017 Calle Engene. All rights reserved.
//

import UIKit

class PetViewController: UIViewController {
    var pet = 0
    @IBOutlet weak var petLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        petLabel.text = "\(pet)"
        print("You selected pet number \(pet)")
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
