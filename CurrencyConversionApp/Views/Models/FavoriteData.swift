//
//  FavoriteData.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 26/08/2023.
//

import Foundation
struct FavoriteData: Codable {
    let statusCode: Int
    let isSuccess: Bool
    let data: [Data]
}

struct Data: Codable {
    let code, name: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case code, name
        case imageURL = "imageUrl"
    }
}
