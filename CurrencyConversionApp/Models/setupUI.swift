//
//  setupUI.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 27/08/2023.
//

import Foundation
import UIKit
import DropDown

class setupUI{
    func setUpLabels(label: UILabel) {
        
        label.backgroundColor = .systemGray6
        label.layer.cornerRadius = 15
        label.layer.masksToBounds = true
        label.frame.size.height = 50
    }
    func setUpFields(field: UITextField) {
        
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 15
        field.layer.masksToBounds = true
        field.frame.size.height = 50
    
    }
    func setUpDropDrown(dropDownButton: DropDown , view: UIView)
    {

        dropDownButton.anchorView = view
        dropDownButton.bottomOffset = CGPoint(x: 0, y: (dropDownButton.anchorView?.plainView.bounds.height)!)
        dropDownButton.topOffset = CGPoint(x: 0, y: -(dropDownButton.anchorView?.plainView.bounds.height)!)
        dropDownButton.direction = .bottom
  

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
    func CustomHeader(title: String, tableView: UITableView) {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 80))
        let titleLabel = UILabel(frame: CGRect(x: 10, y: 20, width: tableView.frame.width, height: 50))
        titleLabel.text = title
        titleLabel.textAlignment = .left
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.textColor = UIColor.black
        titleLabel.backgroundColor = .systemGray6
        headerView.addSubview(titleLabel)
        // Set the header view for the table view
        tableView.tableHeaderView = headerView
    }
    func editMainbuttons(mainButton: UIButton,favoriteButton: UIButton) {
        mainButton.layer.cornerRadius = 15
        mainButton.layer.masksToBounds = true
        
        favoriteButton.layer.cornerRadius = 14
        favoriteButton.layer.masksToBounds = true
        favoriteButton.frame.size.height = 35
        favoriteButton.frame.size.width = 140
        favoriteButton.layer.borderWidth = 0.5
        favoriteButton.layer.borderColor = UIColor.black.cgColor
    }

 
    
}
