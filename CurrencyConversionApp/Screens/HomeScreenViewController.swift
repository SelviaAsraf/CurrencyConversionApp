//
//  HomeScreenViewController.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 25/08/2023.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeView: UIView!
    
    let compareView = CompareView()
    let convertView = ConvertView()
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        navigationController?.setNavigationBarHidden(true, animated: false)
        // Add the segmented control to the view
        homeView.addSubview(segmentedControl)
        mainView.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControl.centerXAnchor.constraint(equalTo: homeView.centerXAnchor),
            segmentedControl.centerYAnchor.constraint(equalTo: homeView.centerYAnchor,constant: 150),
            segmentedControl.widthAnchor.constraint(equalToConstant: 300), // Adjust the width
            segmentedControl.heightAnchor.constraint(equalToConstant: 45) // Adjust the height
        ])
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        
    }
    
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            mainView.addSubview(convertView)
            
        } else if sender.selectedSegmentIndex == 1{
            mainView.addSubview(compareView)
            
        }
        print("Selected index: \(sender.selectedSegmentIndex)")
    }
    
}

