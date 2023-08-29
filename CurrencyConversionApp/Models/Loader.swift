//
//  Loader.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 28/08/2023.
//
import Foundation
import UIKit

class Loader {
    static let shared = Loader()
    private var loader: UIActivityIndicatorView
    
    private init() {
        loader = UIActivityIndicatorView(style: .large)
        loader.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func showLoader(on view: UIView) {
        loader.color = UIColor.gray
        loader.startAnimating()
        view.addSubview(loader)
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func hideLoader() {
        loader.stopAnimating()
        loader.removeFromSuperview()
    }
    
}
