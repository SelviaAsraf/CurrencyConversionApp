//
//  HomeScreenViewController.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 25/08/2023.
//

import UIKit
import DropDown

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainButton: UIButton!
    @IBOutlet weak var tableView: UIView!
    @IBOutlet weak var secondStack: UIStackView!
    @IBOutlet weak var compareView: UIView!
    @IBOutlet weak var convertView: UIView!
    @IBOutlet weak var firstStack: UIStackView!
    @IBOutlet weak var firstTargetCurrencyLabel: UILabel!
    @IBOutlet weak var secondTargetCurrencyLabel: UILabel!
    @IBOutlet weak var secondTargetCurrencyButton: UIButton!
    @IBOutlet weak var portofolioTableView: UITableView!
    @IBOutlet weak var firstTargetCurrencyVButton: UIButton!
    @IBOutlet weak var secondTargetCurrencyView: UIView!
    @IBOutlet weak var firstTargetCurrencyView: UIView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondCountryName: UILabel!
    @IBOutlet weak var secondCountryField: UITextField!
    @IBOutlet weak var secondButtonView: UIView!
    @IBOutlet weak var dropView: UIView!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var countryImage: UIImageView!
    @IBOutlet weak var secondDropDownButton: UIButton!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var favouriteButton: UIButton!
    var firstDropDown = DropDown()
    var secondDropDown = DropDown()
    var thirdDropDown = DropDown()
    var fourthDropDown = DropDown()
    let country = ["egypt","swiss","hhhdh","fytdf"]
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        portofolioTableView.delegate = self
        portofolioTableView.dataSource = self
        portofolioTableView.register(PortofolioTableViewCell.nib(), forCellReuseIdentifier: "PortofolioTableViewCell")
        navigationController?.setNavigationBarHidden(true, animated: false)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: homeView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: homeView.centerYAnchor,constant: 150),
            segmentedControl.widthAnchor.constraint(equalToConstant: 300), // Adjust the width
            segmentedControl.heightAnchor.constraint(equalToConstant: 45) // Adjust the height
        ])
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        setUpUI()
        setUpDropDrown()
        compareView.isHidden = true
        firstStack.layoutIfNeeded()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PortofolioTableViewCell", for: indexPath) as! PortofolioTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    @IBAction func selectSecondTargetCurrency(_ sender: Any) {
        fourthDropDown.show()
    }
    @IBAction func selectTargetCurrency(_ sender: Any) {
        thirdDropDown.show()
    }
    @IBAction func selectSecondCountry(_ sender: Any) {
        secondDropDown.show()
    }
    @IBAction func selectCountry(_ sender: Any) {
        firstDropDown.show()
    }
    
    @IBAction func addToFavorites(_ sender: Any) {
    }
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
            if sender.selectedSegmentIndex == 0 {
                compareView.isHidden = true
                convertView.isHidden = false
                tableView.isHidden = false
                mainButton.setTitle("Convert", for: .normal)
                // Update the layout
                firstStack.layoutIfNeeded()
                secondStack.layoutIfNeeded()
                
                
            } else {
                convertView.isHidden = true
                compareView.isHidden = false
                tableView.isHidden = true
                mainButton.setTitle("Compare", for: .normal)
                // Update the layout
                firstStack.layoutIfNeeded()
                secondStack.layoutIfNeeded()
            }
            print("Selected index: \(sender.selectedSegmentIndex)")
        
    }
    func setUpUI() {
        amountField.backgroundColor = .systemGray6
        amountField.layer.cornerRadius = 15
        amountField.layer.masksToBounds = true
        amountField.frame.size.height = 50
        secondCountryField.backgroundColor = .systemGray6
        secondCountryField.layer.cornerRadius = 15
        secondCountryField.layer.masksToBounds = true
        secondCountryField.frame.size.height = 50
        dropDownButton.backgroundColor = .systemGray6
        dropDownButton.layer.cornerRadius = 15
        dropDownButton.layer.masksToBounds = true
        dropDownButton.frame.size.height = 70
        secondDropDownButton.backgroundColor = .systemGray6
        secondDropDownButton.layer.cornerRadius = 15
        secondDropDownButton.layer.masksToBounds = true
        secondDropDownButton.frame.size.height = 70
        firstLabel.backgroundColor = .systemGray6
        firstLabel.layer.cornerRadius = 15
        firstLabel.layer.masksToBounds = true
        firstLabel.frame.size.height = 50
        secondLabel.backgroundColor = .systemGray6
        secondLabel.layer.cornerRadius = 15
        secondLabel.layer.masksToBounds = true
        secondLabel.frame.size.height = 50
        firstTargetCurrencyVButton.frame.size.height = 50
        firstTargetCurrencyVButton.backgroundColor = .systemGray6
        firstTargetCurrencyVButton.layer.cornerRadius = 15
        firstTargetCurrencyVButton.layer.masksToBounds = true
        secondTargetCurrencyButton.frame.size.height = 50
        secondTargetCurrencyButton.backgroundColor = .systemGray6
        secondTargetCurrencyButton.layer.cornerRadius = 15
        secondTargetCurrencyButton.layer.masksToBounds = true
        secondTargetCurrencyButton.frame.size.height = 50
        favouriteButton.layer.cornerRadius = 14
        favouriteButton.layer.masksToBounds = true
        favouriteButton.frame.size.height = 35
        favouriteButton.frame.size.width = 140
        favouriteButton.layer.borderWidth = 0.5
        favouriteButton.layer.borderColor = UIColor.black.cgColor
    }
    func setUpDropDrown() {
        firstDropDown.anchorView = dropView
        firstDropDown.dataSource = country
       firstDropDown.bottomOffset = CGPoint(x: 0, y: (firstDropDown.anchorView?.plainView.bounds.height)!)
        firstDropDown.topOffset = CGPoint(x: 0, y: -(firstDropDown.anchorView?.plainView.bounds.height)!)
        firstDropDown.direction = .bottom
        firstDropDown.selectionAction = {(index: Int, item: String) in
            self.countryName.text = self.country[index]
            self.countryName.textColor = .black
            
        }
        secondDropDown.anchorView = secondButtonView
        secondDropDown.dataSource = country
        secondDropDown.bottomOffset = CGPoint(x: 0, y: (secondDropDown.anchorView?.plainView.bounds.height)!)
        secondDropDown.topOffset = CGPoint(x: 0, y: -(secondDropDown.anchorView?.plainView.bounds.height)!)
        secondDropDown.direction = .bottom
        secondDropDown.selectionAction = {(index: Int, item: String) in
            self.secondCountryName.text = self.country[index]
            self.countryName.textColor = .black
            
        }
        thirdDropDown.anchorView = firstTargetCurrencyView
        thirdDropDown.dataSource = country
        thirdDropDown.bottomOffset = CGPoint(x: 0, y: (thirdDropDown.anchorView?.plainView.bounds.height)!)
        thirdDropDown.topOffset = CGPoint(x: 0, y: -(thirdDropDown.anchorView?.plainView.bounds.height)!)
        thirdDropDown.direction = .bottom
        thirdDropDown.selectionAction = {(index: Int, item: String) in
            self.firstTargetCurrencyLabel.text = self.country[index]
            self.countryName.textColor = .black
            
        }
        fourthDropDown.anchorView = secondTargetCurrencyView
        fourthDropDown.dataSource = country
        fourthDropDown.bottomOffset = CGPoint(x: 0, y: (fourthDropDown.anchorView?.plainView.bounds.height)!)
        fourthDropDown.topOffset = CGPoint(x: 0, y: -(fourthDropDown.anchorView?.plainView.bounds.height)!)
        fourthDropDown.direction = .bottom
        fourthDropDown.selectionAction = {(index: Int, item: String) in
            self.secondTargetCurrencyLabel.text = self.country[index]
            self.countryName.textColor = .black
            
        }
 
    }
    
}

