//
//  TableViewDelegate.swift
//  LoginFirebase
//
//  Created by Calle Engene on 2017-10-19.
//  Copyright © 2017 Calle Engene. All rights reserved.
//

import Foundation
import UIKit

extension StartViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pets.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    // DELETE
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.pets.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    // EVERY CELL
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! Cell
        let pet = pets[indexPath.row]
        
        cell.labell.text = pet.name
        cell.labelTwo.text = pet.breed
        cell.petImage.image = pet.image
        cell.labell.textColor = UIColor.green
        cell.labell.textAlignment = .left
        return cell
    }
    // SELECTED CELL
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.petSelected = indexPath.row
        performSegue(withIdentifier: "showPet", sender: nil)
        
    }
    
    
}
