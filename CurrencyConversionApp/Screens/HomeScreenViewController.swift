//
//  HomeScreenViewController.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 25/08/2023.
//

import UIKit
import DropDown
import Kingfisher
import Alamofire


class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Outlets
    
    @IBOutlet weak var mainButton: UIButton!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerView: UIView!

    //Second stack table view
    @IBOutlet weak var secondStack: UIStackView!
    @IBOutlet weak var portofolioTableView: UITableView!
    @IBOutlet weak var favouriteButton: UIButton!
    
    //first stack view
    @IBOutlet weak var firstStack: UIStackView!
    //first stack view compare view
    @IBOutlet weak var compareView: UIView!
    @IBOutlet weak var firstTargetCurrencyView: UIView!
    @IBOutlet weak var firstTargetCurrencyVButton: UIButton!
    @IBOutlet weak var firstTargetCurrencyLabel: UILabel!
    @IBOutlet weak var thirdCountryImage: UIImageView!
    @IBOutlet weak var secondTargetCurrencyView: UIView!
    @IBOutlet weak var secondTargetCurrencyButton:
    UIButton!
    @IBOutlet weak var secondTargetCurrencyLabel:
    UILabel!
    @IBOutlet weak var fourthCountryImage: UIImageView!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    
    //first Stack convert View
    @IBOutlet weak var convertView: UIView!
    @IBOutlet weak var secondButtonView: UIView!
    @IBOutlet weak var secondDropDownButton: UIButton!
    @IBOutlet weak var secondCountryImage: UIImageView!
    @IBOutlet weak var secondCountryName: UILabel!
    @IBOutlet weak var resultAmountLabel: UILabel!
    
    // basic View
    @IBOutlet weak var firstCountryName: UILabel!
    @IBOutlet weak var firstCountryImage: UIImageView!
    @IBOutlet weak var firstDropView: UIView!
    @IBOutlet weak var dropDownButton: UIButton!
    @IBOutlet weak var amountField: UITextField!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    
    //MARK: Variables
    var firstDropDown = DropDown()
    var secondDropDown = DropDown()
    var thirdDropDown = DropDown()
    var fourthDropDown = DropDown()
    
    var currencies: Currencies?
    var data: [Datum] = []
    var selectedCurrencies:[String] = []
    
    var viewModel = ViewModel()
    var convertData: ConvertData?
    var dataClass: ConvertClass?
    var compareData: CompareData?
    var compareClass: CompareClass?
    let setup = setupUI()
    
    var favoriteRateData: FavouriteRateData?
    var favoriteData: FavouriteData?
    var currency: [Currency]?
    
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        portofolioTableView.delegate = self
        portofolioTableView.dataSource = self
        portofolioTableView.register(PortofolioTableViewCell.nib(), forCellReuseIdentifier: "PortofolioTableViewCell")
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        setUpWholeUI()
        
        viewModel.fetchData()

        
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        compareView.isHidden = true
        firstStack.layoutIfNeeded()
        
        listenToCountryListener()
        listenToFavoriteDataListener()
        
        

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if !selectedCurrencies.isEmpty {
            selectedCurrencies.removeAll()
        }
    }
    
    
    
    
    //MARK: Table Attributes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteRateData?.data.currencies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PortofolioTableViewCell", for: indexPath) as! PortofolioTableViewCell
        cell.configure(model: (favoriteRateData?.data.currencies[indexPath.row])!)
        //(currencies?.data[indexPath.row])!
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    //MARK: Actions
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
    
    @IBAction func didPressCompareOrConvertButton(_ sender: Any) {
        if ValidationManager.shared.containsOnlyDoubleNumbers(amountField.text ?? "") == true {
            if mainButton.titleLabel?.text == "Convert", let from = firstCountryName.text, let to = secondCountryName.text, let amount = amountField.text {
                if from != "country" && to != "country" {
                    getConvertApiData(from: from, to: to, amount1: amount)
                } else {
                    warningMessage(message: "Please enter the country")
                }
            } else if mainButton.titleLabel?.text == "Compare", let from = firstCountryName.text, let to1 = firstTargetCurrencyLabel.text , let amount = amountField.text, let to2 = secondTargetCurrencyLabel.text  {
                if from != "country" && to1 != "country" && to2 != "country" {
                    getCompareApiData(from: from, to1: to1, amount: amount, to2: to2)
                } else {
                    warningMessage(message: "Please enter the country")
                }
            }
        } else {
            warningMessage(message: "Please enter valid number")
        }
    }
    @IBAction func addToFavorites(_ sender: Any) {
        
        let favoritesViewController = FavoriteViewController()
        favoritesViewController.modalPresentationStyle = .fullScreen
        favoritesViewController.delegate = self
        self.present(favoritesViewController, animated: true)
    }
    
    //MARK: Functions
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            compareView.isHidden = true
            convertView.isHidden = false
            secondStack.isHidden = false
            mainButton.setTitle("Convert", for: .normal)
            // Update the layout
            firstStack.layoutIfNeeded()
            secondStack.layoutIfNeeded()
            
            
        } else {
            convertView.isHidden = true
            compareView.isHidden = false
            secondStack.isHidden = true
            mainButton.setTitle("Compare", for: .normal)
            // Update the layout
            firstStack.layoutIfNeeded()
            secondStack.layoutIfNeeded()
        }
        
    }
    
    
    func getConvertApiData(from: String, to: String, amount1: String) {
        NetworkManager.shared.request(url: "https://graduationprojectbm.up.railway.app/api/v1/currency/conversion?from=\(from)&to1=\(to)&amount=\(amount1)", method: .get) { [weak self] (result: Result<ConvertData, Error>) in
            switch result {
            case .success(let convertData):
                self?.convertData = convertData
                self?.dataClass = convertData.data
                if let amount = self?.dataClass?.amount {
                    self?.resultAmountLabel.text = "\(amount)"
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func getCompareApiData(from: String, to1: String,amount:String ,to2: String) {
        NetworkManager.shared.request(url: "https://graduationprojectbm.up.railway.app/api/v1/currency/conversion?from=\(from)&to1=\(to1)&amount=\(amount)&to2=\(to2)", method: .get) { [weak self] (result: Result<CompareData, Error>) in
            switch result {
            case .success(let compareData):
                self?.compareData = compareData
                self?.compareClass = compareData.data
                if let amount1 = self?.compareClass?.amount1 , let amount2 = self?.compareClass?.amount2 {
                    self?.firstLabel.text = "\(amount1)"
                    self?.secondLabel.text = "\(amount2)"
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
    func listenToCountryListener() {
        viewModel.countryListener = {[weak self] in
            guard let self = self else { return }
            self.firstDropDown.dataSource = self.viewModel.arrayOfCurrencies
            self.secondDropDown.dataSource = self.viewModel.arrayOfCurrencies
            self.thirdDropDown.dataSource = self.viewModel.arrayOfCurrencies
            self.fourthDropDown.dataSource = self.viewModel.arrayOfCurrencies
            self.firstDropDown.selectionAction = {(index: Int, item: String) in
                self.firstCountryName.text = self.viewModel.data[index].code
                self.firstCountryImage.kf.setImage(with: URL(string:self.viewModel.data[index].imageURL ))
                self.firstCountryName.textColor = .black
                if let countryName = self.firstCountryName.text {
                    if !self.selectedCurrencies.isEmpty {
                        self.viewModel.api(base: countryName, country: self.selectedCurrencies)
                    }
                    
                }
            }
            self.secondDropDown.selectionAction = {(index: Int, item: String) in
                self.secondCountryName.text = self.viewModel.data[index].code
                self.secondCountryImage.kf.setImage(with: URL(string:self.viewModel.data[index].imageURL ))
                self.secondCountryName.textColor = .black
            }
            self.thirdDropDown.selectionAction = {(index: Int, item: String) in
                self.firstTargetCurrencyLabel.text = self.viewModel.data[index].code
                self.thirdCountryImage.kf.setImage(with: URL(string:self.viewModel.data[index].imageURL ))
                self.firstTargetCurrencyLabel.textColor = .black
            }
            self.fourthDropDown.selectionAction = {(index: Int, item: String) in
                self.secondTargetCurrencyLabel.text = self.viewModel.data[index].code
                self.fourthCountryImage.kf.setImage(with: URL(string:self.viewModel.data[index].imageURL ))
                self.secondTargetCurrencyLabel.textColor = .black
            }
        }
    
    }
    func listenToFavoriteDataListener () {
        viewModel.countryFavoriteListener = {[weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.favoriteRateData = self.viewModel.dataModel
                self.favoriteData = self.viewModel.favoriteData
                self.currency = self.viewModel.currency
                self.portofolioTableView.reloadData()
            }
        }

    }
    func setUpWholeUI() {
        //setup labels
        setup.setUpLabels(label: resultAmountLabel)
        setup.setUpLabels(label: firstLabel)
        setup.setUpLabels( label: secondLabel)
        
        //setup fields
        setup.setUpFields(field: amountField)
        
        //setup buttons
        setup.setUpButtons(button: dropDownButton)
        setup.setUpButtons(button: secondDropDownButton)
        setup.setUpButtons(button: firstTargetCurrencyVButton)
        setup.setUpButtons(button: secondTargetCurrencyButton)
        
        //setup DropDown
        setup.setUpDropDrown(dropDownButton: firstDropDown, view: firstDropView)
        setup.setUpDropDrown(dropDownButton: secondDropDown, view: secondButtonView)
        setup.setUpDropDrown(dropDownButton: thirdDropDown, view: firstTargetCurrencyView)
        setup.setUpDropDrown(dropDownButton: fourthDropDown, view: secondTargetCurrencyView)
        
        //setup segmentcontroll
        setup.setupSegmentedControl(segmentedControl: segmentedControl, homeView: headerView)
        
        // setup mainbuttons
        setup.editMainbuttons(mainButton: mainButton, favoriteButton: favouriteButton)
        
    }
    
}
extension HomeScreenViewController: FavoritesViewControllerProtocol {
    func setSelectedCurrencies(currencies: [String]) {
        self.selectedCurrencies = currencies
        if let countryName = self.firstCountryName.text {
            if countryName != "country" {
                self.viewModel.api(base: countryName, country: self.selectedCurrencies)
            }
        }
    }
}

