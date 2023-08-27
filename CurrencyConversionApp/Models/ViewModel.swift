//
//  ModelView.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 27/08/2023.
//

import Foundation
class ViewModel {
    
    var autoUpdateTableView: (()->())?
    private (set) var currencyData: CurrencyModel?
    private (set) var currencyImages: CurrencyModelElement?
    private (set) var getCurrencyFlag = false
    private (set) var getRatingFlag = false
    private (set) var keysArray: [String] = []

//    func getCurrencyData() {
//        NetworkManager.shared.request(url: "https://api.currencyfreaks.com/v2.0/supported-currencies") {[weak self]
//             (result: Result<CurrencyModel, Error>) in
//            guard let self = self else { return }
//            switch result {
//            case .success(let currencyData):
//                print("currency:", currencyData)
//                self.currencyData = currencyData
//                self.keysArray = Array(currencyData.supportedCurrenciesMap.keys)
//                self.getCurrencyFlag = true
//                self.autoUpdateTableView?()
//            case .failure(let error):
//                print("Error: \(error.localizedDescription)")
//            }
//        }
//    }
    

    
}
