//
//  FavouriteViewController.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 26/08/2023.
//

import UIKit
import Alamofire

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    
    //MARK: Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    private var currencies: Currencies?
    var data: [Datum] = []
    var delegate: FavoritesViewControllerProtocol?
    var setUp = setupUI()
    var viewModel = ViewModel()
    var selectedCurrency: [String] = []
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchData()
        setUp.CustomHeader(title: "My Favorites", tableView: tableView)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoriteTableViewCell.nib(), forCellReuseIdentifier: "FavoriteTableViewCell")
        tableView.layer.cornerRadius = 15
        tableView.layer.masksToBounds = true
        listenToCountryListener()
    }

    //MARK: Table Attributes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencies?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as! FavoriteTableViewCell
        cell.configure(model: (currencies?.data[indexPath.row])! )
        cell.index = indexPath.row
        cell.isSelectedCountry = {[weak self] isSelected in
            guard let self = self else { return }
            if isSelected {
                
                if let selectedCurrency = currencies?.data[indexPath.row].code {
                    self.selectedCurrency.append(selectedCurrency)
                }
            } else {
                if let index = self.selectedCurrency.firstIndex(of: currencies?.data[indexPath.row].code ?? "" ) {
                    self.selectedCurrency.remove(at: index)

            }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    //MARK: Actions
    @IBAction func exitScreen(_ sender: Any) {
        self.delegate?.setSelectedCurrencies(currencies: self.selectedCurrency)
        dismiss(animated: true) {
            print(self.selectedCurrency)
        }
    }
    func listenToCountryListener () {
        viewModel.countryListener = {[weak self] in
            guard let self = self else { return }
            currencies = self.viewModel.currencies
            data = self.viewModel.data
            tableView.reloadData()
            setSelectedCells()
        }
        
    }
    private func setSelectedCells() {
        selectedCurrency.forEach { currency in
            if let currencyIndex = currencies?.data.firstIndex(where: {$0.code == currency}) , let cell = tableView.cellForRow(at:IndexPath(row: currencyIndex, section: 0) ) as? FavoriteTableViewCell {
                cell.checkButton.isSelected = true
            }
            
        }
       
    }
    
}

protocol FavoritesViewControllerProtocol {
    func setSelectedCurrencies(currencies: [String])
}
