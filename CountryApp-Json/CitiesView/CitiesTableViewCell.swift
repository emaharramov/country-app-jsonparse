//
//  CitiesTableViewCell.swift
//  CountryApp-Json
//
//  Created by Emil Maharramov on 03.10.24.
//

import UIKit

class CitiesTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var cityLabel: UILabel!
    
    static let identifier: String = "CitiesTableViewCell"
    
    private func nib() -> UINib {
        UINib(nibName: "CitiesTableViewCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(with city: CityStruct) {
        cityLabel.text = city.name
    }
    
}
