////
////  network.swift
////  CurrencyConversionApp
////
////  Created by Selvia Ashraf on 28/08/2023.
////
//
//import Foundation
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    private init() {}
//    
//    func performGetRequest(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            if let data = data {
//                completion(.success(data))
//            } else {
//                completion(.failure(NetworkError.noData))
//            }
//        }.resume()
//    }
//    
//    func performPostRequest(url: URL, data: Data, completion: @escaping (Result<Data, Error>) -> Void) {
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.httpBody = data
//        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//                return
//            }
//            
//            if let data = data {
//                completion(.success(data))
//            } else {
//                completion(.failure(NetworkError.noData))
//            }
//        }.resume()
//    }
//}
//
//enum NetworkError: Error {
//    case noData
//}
