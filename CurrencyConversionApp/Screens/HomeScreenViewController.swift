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
    var currencies : [CurrencyModelElement] = []
    let setup = setupUI()
    
    let country = ["egypt","swiss","hhhdh","fytdf"]
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        portofolioTableView.delegate = self
        portofolioTableView.dataSource = self
        portofolioTableView.register(PortofolioTableViewCell.nib(), forCellReuseIdentifier: "PortofolioTableViewCell")
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setup.setUpFieldsAndlabels(field: amountField, label: firstLabel)
        setup.setUpFieldsAndlabels(field: secondCountryField, label: secondLabel)
        
        setup.setUpButtons(button: dropDownButton)
        setup.setUpButtons(button: secondDropDownButton)
        setup.setUpButtons(button: firstTargetCurrencyVButton)
        setup.setUpButtons(button: secondTargetCurrencyButton)
        
        setup.setUpDropDrown(dropDownButton: firstDropDown, view: dropView, countryName: countryName)
        setup.setUpDropDrown(dropDownButton: secondDropDown, view: secondButtonView, countryName: secondCountryName)
        setup.setUpDropDrown(dropDownButton: thirdDropDown, view: firstTargetCurrencyView, countryName: firstTargetCurrencyLabel)
        setup.setUpDropDrown(dropDownButton: fourthDropDown, view: secondTargetCurrencyView, countryName: secondTargetCurrencyLabel)
        setup.setupSegmentedControl(segmentedControl: segmentedControl, homeView: homeView)
        
        editMainbuttons()
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
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
 
    func editMainbuttons() {
        mainButton.layer.cornerRadius = 15
        mainButton.layer.masksToBounds = true
        
        favouriteButton.layer.cornerRadius = 14
        favouriteButton.layer.masksToBounds = true
        favouriteButton.frame.size.height = 35
        favouriteButton.frame.size.width = 140
        favouriteButton.layer.borderWidth = 0.5
        favouriteButton.layer.borderColor = UIColor.black.cgColor
    }
        
    

    
    func getRatingData() {
        NetworkManager.shared.request(url:"currencyconversion-production-38ba.up.railway.app/currency/") { [weak self] (result: Result<[CurrencyModelElement], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let currencies):
                self.currencies = currencies
                print("currency:", currencies)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    //    func configure(model: CurrencyModelElement) {
    //        countryImage.load(urlString: model.imageURL)
    //        countryName.text = model.currencyCode
    //    }
    
}


