//
//  FavouriteViewController.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 26/08/2023.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(FavoriteTableViewCell.nib(), forCellReuseIdentifier: "FavoriteTableViewCell")
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteTableViewCell", for: indexPath) as! FavoriteTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70
    }
    
    @IBAction func exitScreen(_ sender: Any) {
    }
    

}
