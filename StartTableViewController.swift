//
//  StartTableViewController.swift
//  ContactsHW
//
//  Created by vitasiy on 04.11.2020.
//

import UIKit

protocol SecondViewControllerDelegate {
    var delegatePerson: [Person] { get }
}

class StartTableViewController: UITableViewController {
    
    let persons = Person.getData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let secondTVC = tabBarController?.viewControllers?.last as! SecondTableViewController
        secondTVC.delegate = self
//        navigationController?.title = "Persons List"
        tabBarController?.title = "Persons List"
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID",
                                                 for: indexPath)
        let content = persons[indexPath.row]
        cell.textLabel?.text = content.fullName
        cell.textLabel?.font = UIFont.systemFont(ofSize: 22)
        cell.textLabel?.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1) : .white
        return cell
    }
    
    //   MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let contactsInfoVC = segue.destination as! ContactsInfoViewController
        guard let index = tableView.indexPathForSelectedRow?.row else { return }
        contactsInfoVC.persons = persons[index]
    }
}

extension StartTableViewController: SecondViewControllerDelegate {
    var delegatePerson: [Person] {
        persons
    }
}
