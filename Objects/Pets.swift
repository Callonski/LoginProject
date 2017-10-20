//
//  Pets.swift
//  LoginFirebase
//
//  Created by Calle Engene on 2017-10-19.
//  Copyright © 2017 Calle Engene. All rights reserved.
//

import Foundation
import UIKit

struct Pet {
    var name: String?
    var breed: String?
    var gender: String?
    var image: UIImage?
    
    init(name: String, breed: String, gender: String, image: UIImage) {
        self.name = name
        self.breed = breed
        self.gender = gender
        self.image = image
    }
}





