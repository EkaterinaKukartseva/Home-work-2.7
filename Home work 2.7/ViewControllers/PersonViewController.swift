//
//  PersonViewController.swift
//  Home work 2.7
//
//  Created by EKATERINA  KUKARTSEVA on 22.12.2020.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        phoneLabel.text = person.phone
        emailLabel.text = person.email
        
    }

}
