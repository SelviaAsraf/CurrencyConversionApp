//
//  HomeView.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 25/08/2023.
//

import UIKit

import Foundation
import UIKit
class HomeView: UIView {
    private let label = UILabel()
    private let titleLabel = UILabel()
    private let subTitleLabel = UILabel()
    private let imageView = UIImageView()
    let screenHeight = UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale
    let screeWidth = UIScreen.main.bounds.width
    let screenX = UIScreen.main.nativeBounds.origin.x / UIScreen.main.nativeScale
    let screenY = UIScreen.main.nativeBounds.origin.y / UIScreen.main.nativeScale
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        // Add your custom view components here
        setUpImage()
        
    }
    func setUpImage() {
        // Set the image
        let backgroundImage = UIImage(named: "background") // Replace "background_image" with your image's filename
        imageView.image = backgroundImage
        // Set the content mode to scale the image appropriately
        imageView.contentMode = .scaleAspectFill
        // Position and size the image view to match the view controller's view
        imageView.frame = self.bounds
        // Add the image view as a background subview
        imageView.clipsToBounds = true // Clip to bounds to avoid image overflow
        addSubview(imageView)
        
    }
    func setUpUI() {
        // Configure subviews
        addSubview(label)
        label.text = "Currency converter"
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 27, weight: .regular)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        addSubview(titleLabel)
        
        // Configure subviews
        titleLabel.text = "ConCurrency"
        titleLabel.textColor = .white
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: 25)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 70),
            titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        addSubview(subTitleLabel)
        // Configure subviews
        subTitleLabel.text = "Check live foreign currency exchange rates"
        subTitleLabel.textColor = .white
        subTitleLabel.textAlignment = .center
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font =  UIFont.systemFont(ofSize: 15, weight: .regular)
        NSLayoutConstraint.activate([
            subTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            subTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 50)
        ])
    }
    
    
    
    
    
}

