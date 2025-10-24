//
//  NetworkManager.swift
//  SwiftUI_Oct21
//
//  Created by Koushik Reddy Kambham on 10/22/25.
//

import SwiftUI
import Alamofire

class NetworkManager1 {
    static let shared = NetworkManager1()
    
    private init() {}
    
    func fetchData<T: Decodable>(urlString : String) async -> [T] {
        guard let url = URL(string: urlString) else {
            print("inavlid url")
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let fetchedData = try JSONDecoder().decode([T].self, from: data)
            return fetchedData
        }
        catch {
            print("unable to decode data")
            return []
        }
    }
    
    func getDataFromAF(urlString : String) {
        AF.request(urlString)
            .responseString { response in
                print(response.response?.statusCode)
            }
    }
}
