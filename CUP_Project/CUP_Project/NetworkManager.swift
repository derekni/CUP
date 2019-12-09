//
//  NetworkManager.swift

import Foundation
import Alamofire

// How do we make network calls?
class NetworkManager {
    private static let getPoint = "http://35.231.165.9/bathrooms/"
    private static var postPoint = "http://35.231.165.9/bathroom/"
    
    static func getBathrooms(completion: @escaping ([Bathroom]) -> Void) {
        AF.request(getPoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                if let bathroomsData = try? jsonDecoder.decode(BathroomResponse.self, from: data) {
                    let bathrooms = bathroomsData.data.bathrooms
                    completion(bathrooms)
                }

            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func changeAvgRating(rating: Float, bathroomID: Int) {
        let parameters: [String: Float] = [
            "rating": rating
        ]
        postPoint.append(String(bathroomID))
        print(postPoint)

        AF.request(postPoint, method: .post, parameters: parameters, encoding: JSONEncoding.default).validate(statusCode: 200..<600).responseData { response in
            print(response.result)
        }
        postPoint = "http://35.231.165.9/bathroom/"
    }
    
}
