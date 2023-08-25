//
//  HomeScreenViewController.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 25/08/2023.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var homeView: UIView!
    //MARK: Variables
    //  var homeView = HomeView()
//    var buttonView = ButtonView()
//    let screenHeight = UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale
//    let screeWidth = UIScreen.main.bounds.width / UIScreen.main.nativeScale
//    let screenX = UIScreen.main.nativeBounds.origin.x / UIScreen.main.nativeScale
//    let screenY = UIScreen.main.nativeBounds.origin.y / UIScreen.main.nativeScale
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(scrollView)
        scrollView.addSubview(tableView)
        tableView.addSubview(homeView)
        let segmentedControl = UISegmentedControl(items: ["Convert", "Compare"])
                segmentedControl.selectedSegmentIndex = 0 // Set the initial selected index
                segmentedControl.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
                
                // Customize the appearance of the segmented control
                segmentedControl.tintColor = UIColor.blue
        segmentedControl.backgroundColor = .white
        segmentedControl.layer.cornerRadius = 30
        segmentedControl.layer.masksToBounds = true
                // Add the segmented control to the view
        tableView.addSubview(segmentedControl)

                // Adding Auto Layout constraints for the segmented control
                segmentedControl.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 170),
                    segmentedControl.widthAnchor.constraint(equalToConstant: 274.93), // Adjust the width
                                segmentedControl.heightAnchor.constraint(equalToConstant: 50)
                ])

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
    


}
//        homeView = HomeView(frame: CGRect(x: screenX, y: screenY, width: screeWidth, height: screenHeight/3))
//        tableView.addSubview(homeView)
//        buttonView = ButtonView(frame: CGRect(x: screenX, y: screenY, width: screeWidth/2, height: screenHeight/4))
//        buttonView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.addSubview(buttonView)
//        NSLayoutConstraint.activate([
//            buttonView.centerXAnchor.constraint(equalTo: homeView.centerXAnchor),
//            buttonView.centerYAnchor.constraint(equalTo: homeView.centerYAnchor,constant: 150),
//            buttonView.widthAnchor.constraint(equalToConstant: 274.93), // Width of 200 points
//            buttonView.heightAnchor.constraint(equalToConstant: 54.06) // Height of 200 points
//                ])
