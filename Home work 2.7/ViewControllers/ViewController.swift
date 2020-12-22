//
//  ViewController.swift
//  Home work 2.7
//
//  Created by EKATERINA  KUKARTSEVA on 22.12.2020.
//

import UIKit

class ViewController: UIViewController {
    
    let identifier = "PersonCell"
    var personList = [Person]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personList = generationPersonList()
    }
    
    private func generationPersonList() -> Array<Person> {
        var array = [Person]()
        
        let dataManager = DataManager()
        
        let fName = dataManager.firstNameArray.shuffled()
        let sName = dataManager.secondNameArray.shuffled()
        let phone = dataManager.phoneArray.shuffled()
        let email = dataManager.emailArray.shuffled()
        
        for i in 0...9 {
            
            let person = Person(firstName: fName[i], secondName: sName[i], email: email[i], phone: phone[i])
            
            array.append(person)
        }
        
        return array
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let personVC = segue.destination as? PersonViewController {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            personVC.person = personList[indexPath.row]
        }
    }
    

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let person = personList[indexPath.row]
        
        cell.textLabel?.text = person.firstName + " " + person.secondName
        
        return cell
    }
    
    
}

