//
//  ApiService.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation
enum NetworkError: Error {
    case badUrl
    case badResponse
}

class ApiService : NSObject {
    private let baseUrl = ""
    
    private let sourcesURL = URL(string: "https://api.restful-api.dev/objects")!
    func fetchDeviceDetails() async throws -> [DeviceData] {
        guard let url = URL(string: "https://api.restful-api.dev/objects") else {
            throw NetworkError.badUrl
        }
        let (data,response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw NetworkError.badResponse
        }
//        let output = String(data: data, encoding: .utf8)
        return try JSONDecoder().decode([DeviceData].self, from: data)
    }
//    func fetchDeviceDetails(completion : @escaping ([DeviceData]) -> ()){
//        
//        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
//            if let error = error {
//                print("Network error: \(error.localizedDescription)")
//                completion([]) // Return an empty array on network failure
//                return
//            }
//            
//            if let data = data {
//                let jsonDecoder = JSONDecoder()
//                let empData = try! jsonDecoder.decode([DeviceData].self, from: data)
//                print(empData)
//                if (empData.isEmpty) {
//                    completion([])
//                }
//            }
//            
//        }.resume()
//    }
}
