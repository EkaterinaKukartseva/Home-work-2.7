//
//  PersonListTableViewController.swift
//  Home work 2.7
//
//  Created by EKATERINA  KUKARTSEVA on 22.12.2020.
//

import UIKit

class PersonListTableViewController: UITableViewController {
    
    var expandedPersonList = [ExpandedPerson]()
    let identifier = "PersonCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let personList = getPersonList()
        expandedPersonList = modificationPersonList(personList)
    }
    
    private func getPersonList() -> Array<Person> {
        let personList = [Person]()
        
        guard let navigationVC = tabBarController?.viewControllers?.first as? UINavigationController, let viewController = navigationVC.topViewController as? ViewController else {
            return personList
        }
        return viewController.personList
    }
    
    private func modificationPersonList(_ list: Array<Person>) -> Array<ExpandedPerson> {
        
        var array = [ExpandedPerson]()
        
        for item in list {
            let expandedPerson = ExpandedPerson(title: "\(item.firstName) \(item.secondName)", array: [item.phone, item.email])
            
            array.append(expandedPerson)
        }
        
        return array
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return expandedPersonList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expandedPersonList[section].array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        cell.textLabel?.text = expandedPersonList[indexPath.section].array[indexPath.row]
        if indexPath.row == 0 {
            cell.imageView?.image = UIImage(systemName: "phone")
        } else {
            cell.imageView?.image = UIImage(systemName: "envelope")
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        expandedPersonList[section].title
    }
    
}
