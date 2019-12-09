//
//  NetworkManager.swift

import Foundation
import Alamofire

enum ExampleDataResponse<T: Any> {
    case success(data: T)
    case failure(error: Error)
}

let getPoint = "http://35.231.165.9/bathrooms/"

// How do we make network calls?
class NetworkManager {
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
}
