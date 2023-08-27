//////
//////  NetworkManager.swift
//////  CurrencyConversionApp
//////
//////  Created by Selvia Ashraf on 27/08/2023.
//////
//
//import Foundation
//import Alamofire
//
//class NetworkManager {
//    static let shared = NetworkManager()
//
//    private init() {}
//
//    func request<T: Decodable>(
//        url: URLConvertible,
//        method: HTTPMethod = .get,
//        parameters: Parameters? = nil,
//        headers: HTTPHeaders? = nil,
//        completion: @escaping (Result<T, Error>) -> Void
//    ) {
//        AF.request(url, method: method, parameters: parameters, headers: headers)
//            .validate()
//            .responseDecodable(of: T.self) { response in
//                switch response.result {
//                case .success(let value):
//                    completion(.success(value))
//                case .failure(let error):
//                    completion(.failure(error))
//                }
//            }
//    }
//}
