//
//  PortofolioTableViewCell.swift
//  CurrencyConversionApp
//
//  Created by Selvia Ashraf on 27/08/2023.
//

import UIKit

class PortofolioTableViewCell: UITableViewCell {

    @IBOutlet weak var countryRate: UILabel!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var countryImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib {
        return UINib(nibName: "PortofolioTableViewCell", bundle: nil)
    }
}
