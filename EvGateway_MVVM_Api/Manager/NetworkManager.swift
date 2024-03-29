//
//  NetworkManager.swift
//  EvGateway_MVVM_Api
//
//  Created by Nanthini on 10/02/24.
//

import Foundation

class NetworkManager {
    
    class func fetchData(urlString: String, completion: @escaping ([DataModel]?, String?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, "INVALID URL")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil, "Getting Error Response")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(Datas.self, from: data)
                completion(result.data, nil)
            } catch {
                completion(nil, "Error decoding data")
            }
        }.resume()
    }
}
