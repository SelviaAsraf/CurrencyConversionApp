//
//  HomeScreenViewController.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 25/08/2023.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeView: UIView!

    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        scrollView.addSubview(tableView)
        tableView.addSubview(homeView)
        // Add the segmented control to the view
        homeView.addSubview(segmentedControl)
        tableView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: homeView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: homeView.centerYAnchor,constant: 150),
            segmentedControl.widthAnchor.constraint(equalToConstant: 300), // Adjust the width
            segmentedControl.heightAnchor.constraint(equalToConstant: 45) // Adjust the height
        ])
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
      
        
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        return cell
    }
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        print("Selected index: \(sender.selectedSegmentIndex)")
    }
   
