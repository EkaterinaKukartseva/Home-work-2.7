//
//  PersonTableViewCell.swift
//  Home work 2.7
//
//  Created by EKATERINA  KUKARTSEVA on 23.12.2020.
//

import UIKit

class PersonTableViewCell: UITableViewCell {

    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        background.layer.borderWidth = 1
        background.layer.cornerRadius = 10
        background.layer.borderColor = UIColor.brown.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setConfiguration(model: Person) {
        self.firstNameLabel.text = model.firstName
        self.secondNameLabel.text = model.secondName
    }
    
}
