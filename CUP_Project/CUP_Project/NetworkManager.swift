//
//  NetworkManager.swift

import Foundation
import Alamofire

// How do we make network calls?
class NetworkManager {
    private static let getPoint = "http://35.231.165.9/bathrooms/"
    private static let sadPoint = "https://mindylou.github.io/classes.json"
    
//    static func getBathrooms(completion: @escaping ([Bathroom]) -> Void) {
//        AF.request(getPoint, method: .get).validate().responseData { response in
//            switch response.result {
//            case .success(let data):
//                let jsonDecoder = JSONDecoder()
//                print("json is decoded")
//                print(BathroomResponse.self)
//                print(data)
//                print(response.result)
//                if let bathroomsData = try? jsonDecoder.decode(BathroomResponse.self, from: data) {
//                    let bathrooms = bathroomsData.data.bathrooms
//                    print(bathrooms)
//                    completion(bathrooms)
//                }
//                
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    static func getBathrooms(completion: @escaping ([Bathroom]) -> Void) {
        AF.request(getPoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                print("json is decoded")
                print(BathroomResponse.self)
                print(data)
                print(response.result)
                if let bathroomsData = try? jsonDecoder.decode(BathroomResponse.self, from: data) {
                    let bathrooms = bathroomsData.data.bathrooms
                    print(bathrooms)
                    completion(bathrooms)
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
