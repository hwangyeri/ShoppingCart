//
//  APIService.swift
//  ShoppingCart
//
//  Created by 황예리 on 2023/09/08.
//

import Foundation

final class APIService {
    
    static let shared = APIService()
    
    private init() { }

    func searchShopping(type: Endpoint.SortType, query: String, page: Int, start: Int, completion: @escaping (Shopping?) -> Void ) {
        
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
       
        let endpoint = Endpoint.shopping(type: type, query: query, page: page, start: start)
        
        guard let url = URL(string: endpoint.requestURL) else { return }
        print("------- url -------", url)
        
        var request = URLRequest(url: url)
        
        //Header
        request.httpMethod = "GET"
        request.setValue("\(APIKey.naverIDKey)", forHTTPHeaderField: "X-Naver-Client-Id")
        request.setValue("\(APIKey.naverSecretKey)", forHTTPHeaderField: "X-Naver-Client-Secret")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("Error: \(error)")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...500).contains(response.statusCode) else {
                print("Invalid response")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            //print("============ api 서비스 ", String(data: data!, encoding: .utf8))
            
            do {
                let result = try JSONDecoder().decode(Shopping.self, from: data)
                completion(result)
                print(result, "----- result End -----")
                
            } catch {
                print("Error decoding data: \(error)")
                completion(nil)
            }
        }.resume()
        
    }

    
    
}
