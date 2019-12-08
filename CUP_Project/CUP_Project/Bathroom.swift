//
//  Bathroom.swift
//  jzp5
//
//  Created by Jerry Peng on 11/24/19.
//  Copyright © 2019 Jerry Peng. All rights reserved.
//

import Foundation
import UIKit

class Bathroom {
    var name: String
    var location: String
    var rating: String
    var displayPicName: String
    var image: UIImage!
    
    init(name: String, location: String, rating: String, image: String) {
        self.name = name
        self.location = location
        self.rating = rating
        self.displayPicName = image
        self.image = UIImage(named: image)
    }
    
    func setBathroomName(to name: String) {
        self.name = name
    }
    func setLocation(to location: String) {
        self.location = location
    }
    func setRating(to rating: String) {
        self.rating = rating
    }
}
