//
//  setupUI.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 27/08/2023.
//

import Foundation
import UIKit
import DropDown

let country = ["egypt","swiss","hhhdh","fytdf"]
class setupUI{
    func setUpFieldsAndlabels(field: UITextField , label: UILabel) {
        
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 15
        field.layer.masksToBounds = true
        field.frame.size.height = 50
        
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.frame.size.height = 50
        
        
    }
    func setUpDropDrown(dropDownButton: DropDown , view: UIView, countryName: UILabel) {
        
        dropDownButton.anchorView = view
        dropDownButton.dataSource = country
        dropDownButton.bottomOffset = CGPoint(x: 0, y: (dropDownButton.anchorView?.plainView.bounds.height)!)
        dropDownButton.topOffset = CGPoint(x: 0, y: -(dropDownButton.anchorView?.plainView.bounds.height)!)
        dropDownButton.direction = .bottom
        dropDownButton.selectionAction = {(index: Int, item: String) in
            countryName.text = country[index]
            countryName.textColor = .black
            
        }
    }
    func setupSegmentedControl (segmentedControl: UISegmentedControl, homeView: UIView) {
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: homeView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: homeView.centerYAnchor,constant: 150),
            segmentedControl.widthAnchor.constraint(equalToConstant: 300), // Adjust the width
            segmentedControl.heightAnchor.constraint(equalToConstant: 45) // Adjust the height
        ])
        
    }
    func setUpButtons(button: UIButton) {
        button.backgroundColor = .systemGray6
        button.layer.cornerRadius = 15
        button.layer.masksToBounds = true
        button.frame.size.height = 70
    }
    
}
