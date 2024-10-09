//
//  CountriesTableViewCell.swift
//  CountryApp-Json
//
//  Created by Emil Maharramov on 03.10.24.
//

import UIKit

class CountriesTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var customImageView: UIImageView!
    @IBOutlet private weak var customLabel: UILabel!
    
    static let identifier: String = "CountriesTableViewCell"
    
    private func nib() -> UINib {
        UINib(nibName: "CountriesTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with country: CountryStruct) {
        customImageView.image = UIImage(named: country.flagImageName)
        customLabel.text = country.name
    }
    
}

