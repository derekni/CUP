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
    var rating: Double
    var displayPicName: String
    var image: UIImage!
    
    init(name: String, location: String, image: String) {
        self.name = name
        self.location = location
        self.rating = 0.0
        self.displayPicName = image
        self.image = UIImage(named: image)
    }
    
    func setBathroomName(to name: String) {
        self.name = name
    }
    func setLocation(to location: String) {
        self.location = location
    }
    func setRating(to rating: Double) {
        self.rating = rating
    }
}
