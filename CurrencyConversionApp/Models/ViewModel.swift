//
//  ViewModel.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 27/08/2023.


import Foundation
import DropDown
import UIKit
import Alamofire

class ViewModel {
    var currencies: Currencies?
    var data: [Datum] = []
    var arrayOfCurrencies: [String] = []
    var countryListener: (()->())?
    var countryFavoriteListener: (()->())?
    var dataModel: FavouriteRateData?
    var favoriteData: FavouriteData?
    var currency: [Currency]?
    
     func fetchData() {
        NetworkManager.shared.request(url: "https://graduationprojectbm.up.railway.app/api/v1/currency", method: .get) { [weak self] (result: Result<Currencies, Error>) in
            switch result {
            case .success(let currencies):
                self?.currencies = currencies
                self?.data = currencies.data
                self?.arrayOfCurrencies.append(contentsOf: self?.data.map({$0.code}) ?? [])
                self?.countryListener?()
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
    func fechFavouriteData(base: String, country: [String]) {
                let country = country
                var headers = HTTPHeaders()
                headers["Content-Type"] = "application/json"

                do {
                    var jsonData = try? JSONSerialization.data(withJSONObject: country)
                    let url = "https://graduationprojectbm.up.railway.app/api/v1/currency?base=\(base)"
                    var urlRequest = try URLRequest.init(url: url, method: .post)
                    urlRequest.httpBody = jsonData
                    urlRequest.headers = headers
                    let session = URLSession.shared
                    let task = session.dataTask(with: urlRequest){
                        data , response , error in
                        if let error = error {
        
                            print("Error\(error)")
                        } else if let response = response, let data = data {
                            print("Response\(response)")
                            let dataModel = try? JSONDecoder().decode(FavouriteRateData.self, from: data)
                            self.dataModel = dataModel
                            self.favoriteData = dataModel?.data
                            self.currency = self.favoriteData?.currencies
                            print(dataModel)
                            self.countryFavoriteListener?()
                           
                        }
                    }
                    task.resume()
                }
             catch {
                                 print("Error creating JSON: \(error)")
                             }
                
    }
}
