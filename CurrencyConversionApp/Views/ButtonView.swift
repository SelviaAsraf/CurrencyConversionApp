//
//  ButtonView.swift
//  GraduationBM
//
//  Created by Selvia Ashraf on 24/08/2023.
//

import UIKit

class ButtonView: UIView {
    let buttonView = UIView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setUpView()
        setUpUIButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        setUpView()
    }
    
    private func commonInit() {
        // Add your custom view components here
        
    }
    func setUpView() {
        addSubview(buttonView)
        self.layer.cornerRadius = 25
        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 3
        
    }
    func setUpUIButton() {

        let buttonConvert = UIButton(frame: CGRect(x: 65,
                                                   y: 270,
                                                   width: 136,
                                                   height: 59))

        
    }

}
