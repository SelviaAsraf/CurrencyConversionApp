////
////  Extension.swift
////  CurrencyConversion
////
////  Created by esterelzek on 23/08/2023.
////
//
//import Foundation
//import UIKit
//
//extension UIView {
//    func setCornerRdius(radius: CGFloat) {
//        self.layer.masksToBounds = true
//        self.layer.cornerRadius = radius
//    }
//}
//
//extension UIImageView {
//    func load(urlString: String) {
//        guard let url = URL(string: urlString) else {
//            return
//        }
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url){
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
