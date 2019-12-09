//
//  Bathroom.swift
//  jzp5
//
//  Created by Jerry Peng on 11/24/19.
//  Copyright © 2019 Jerry Peng. All rights reserved.
//

import Foundation


// The response we get contains a key for data, so the CourseResponse object
// contains a variable called data. Each one of these structs must conform
// to codable in order to be decoded from JSON.
struct BathroomResponse: Codable {
    var data: BathroomDataResponse
}

//// The data key maps to this CourseDataResponse type. In here, there's a
//// JSON that maps "classes" to an array of courses.
struct BathroomDataResponse: Codable {
    var bathrooms: [Bathroom]
}

struct Bathroom: Codable{
    var id: Int
    var name: String
    var description: String
    var avgRating: Float
    var numRatings: Int
}
//
//struct BathroomResponse: Codable {
//    var success: String
//    var
//}
