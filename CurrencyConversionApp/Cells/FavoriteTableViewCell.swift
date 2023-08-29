//
//  FavoriteTableViewCell.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 26/08/2023.
//

import UIKit
import Kingfisher

class FavoriteTableViewCell: UITableViewCell {

    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var countryCurrency: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    
    var isSelectedCountry: ((Bool)->())?
   // var delegete: FavoritesTableViewCellProtocol?
    var index: Int = 0
    var data: [Datum] = []
    var isChecked = false
    var viewModel = ViewModel()
    override func awakeFromNib() {
        super.awakeFromNib()
        countryImage.layer.cornerRadius = 17
        countryImage.contentMode = .scaleToFill
        countryImage.layer.masksToBounds = true

        // Initialization code
    }

    @IBAction func selectCountry(_ sender: UIButton) {
        if sender.isSelected {
            sender.isSelected = false
            
        } else {
            sender.isSelected = true
        }
        isSelectedCountry?(sender.isSelected)
    }
    static func nib() -> UINib {
        return UINib(nibName: "FavoriteTableViewCell", bundle: nil)
    }
    func configure(model: Datum) {
        countryImage.kf.setImage(with: URL(string:model.imageURL ))
        countryName.textColor = .black
        countryName.text = model.code
    }
    
}
//protocol FavoritesTableViewCellProtocol: AnyObject {
//    func setSelection(isSelected: Bool , index: Int)
//}
