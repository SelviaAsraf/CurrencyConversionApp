//
//  ConvertView.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 25/08/2023.
//

import UIKit
import DropDown

class ConvertView: UIView {
    private let amountLabel = UILabel()
    private var amountTextField = UITextField()
    private let fromLabel = UILabel()
    private let toLabel = UILabel()
    private let resultAmountLabel = UILabel()
    private var dropDownButton = UIButton()
    private var countryLabel = UILabel()
    var dropDown = DropDown()
    let country = ["egypt","swiss","hhhdh","fytdf"]
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setUpUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setUpUI()
    }
    
    private func commonInit() {
        setUpUI()
        // Add your custom view components here
        
    }
    func setUpUI() {
        // Configure subviews
        addSubview(amountLabel)
        amountLabel.text = "Amount"
        amountLabel.textColor = .black
        amountLabel.textAlignment = .left
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        NSLayoutConstraint.activate([
            amountLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 80),
            amountLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 50)
        ])
        addSubview(amountTextField)
        amountTextField = UITextField(frame: CGRect(x: 40, y: 80, width: 140, height: 50))
        amountTextField.backgroundColor = .systemGray6
        amountTextField.layer.cornerRadius = 20
        amountTextField.layer.masksToBounds = true
        addSubview(fromLabel)
        fromLabel.text = "From"
        fromLabel.textColor = .black
        fromLabel.textAlignment = .right
        fromLabel.translatesAutoresizingMaskIntoConstraints = false
        fromLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        NSLayoutConstraint.activate([
            fromLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 230),
            fromLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 50)
        ])
        addSubview(amountTextField)
        amountTextField = UITextField(frame: CGRect(x: 40, y: 80, width: 140, height: 50))
        amountTextField.backgroundColor = .systemGray6
        amountTextField.layer.cornerRadius = 20
        amountTextField.layer.masksToBounds = true
        
        addSubview(dropDown)
        addSubview(dropDownButton)
        addSubview(countryLabel)
        dropDown = DropDown(frame: CGRect( x: 80, y: 80, width: 140, height: 50))
        dropDownButton = UIButton(frame:  CGRect( x: 80, y: 80, width: 140, height: 50))
        countryLabel = UILabel(frame:  CGRect( x: 80, y: 80, width: 140, height: 50))
        dropDown.anchorView = self
        dropDown.dataSource = country
        dropDown.bottomOffset = CGPoint(x: 0, y: dropDown.anchorView?.plainView.bounds.height ?? 0)
        dropDown.topOffset = CGPoint(x: 0, y: -(dropDown.anchorView?.plainView.bounds.height ?? 0) )
        dropDown.direction = .bottom
        dropDown.selectionAction = {(index: Int, item: String) in
            self.countryLabel.text = self.country[index]
            self.countryLabel.textColor = .black
        }
        
        
        
        
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        dropDown.show()
    }
    
    
}
