//
//  ConvertView.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 25/08/2023.
//

import UIKit

class ConvertView: UIView {
    private let amountLabel = UILabel()
    private var amountTextField = UITextField()
    private let fromLabel = UILabel()
    private let toLabel = UILabel()
    private let resultAmountLabel = UILabel()
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

        
   

    }


}
