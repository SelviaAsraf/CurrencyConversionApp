////
////  Model.swift
////  CurrencyConversionApp
////
////  Created by Selvia Ashraf on 27/08/2023.
////
//
import Foundation
//https://graduationprojectbm.up.railway.app/api/v1/currency/conversion?from=KWD&to1=EGP&amount=2
// MARK: - ConvertData
struct ConvertData: Codable {
    let statusCode: Int
    let isSuccess: Bool
    let data: ConvertClass
}

// MARK: - DataClass
struct ConvertClass: Codable {
    let source, destination: String
    let amount: Double
}
// MARK: - CompareData
//https://graduationprojectbm.up.railway.app/api/v1/currency/conversion?from=KWD&to1=EGP&amount=2&to2=USD
struct CompareData: Codable {
    let statusCode: Int
    let isSuccess: Bool
    let data: CompareClass
}

// MARK: - DataClass
struct CompareClass: Codable {
    let source, destination1, destination2: String
    let amount1, amount2: Double
}

//MARK: - Currencies
struct Currencies: Codable {
    let statusCode: Int
    let isSuccess: Bool
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let code, name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case code, name
        case imageURL = "imageUrl"
       
    }
}

// MARK: - FavouriteRateData
struct FavouriteRateData: Codable {
    let statusCode: Int
    let isSuccess: Bool
    let data: FavouriteData
}

// MARK: - DataClass
struct FavouriteData: Codable {
    let base: String
    let currencies: [Currency]
}

// MARK: - Currency
struct Currency: Codable {
    let code, name: String
    let imageURL: String
    let rate: Double

    enum CodingKeys: String, CodingKey {
        case code, name
        case imageURL = "imageUrl"
        case rate
    }
}








