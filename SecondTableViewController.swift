//
//  SecondTableViewController.swift
//  ContactsHW
//
//  Created by vitasiy on 04.11.2020.
//

import UIKit

class SecondTableViewController: UITableViewController {
    
    var delegate: SecondViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarController?.title = "Persons List"
        //        tableView(tableView, numberOfRowsInSection: 2)
        }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return delegate.delegatePerson.count
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView,
                            titleForHeaderInSection section: Int) -> String? {
        delegate.delegatePerson[section].fullName
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "secondCellID",
                                                 for: indexPath)
        let content = delegate.delegatePerson[indexPath.section]
        cell.textLabel?.text = indexPath.row == 0 ? content.phone : content.email
        cell.imageView?.image = indexPath.row == 0 ?
            UIImage(systemName: "phone") :
            UIImage(systemName: "envelope")
        return cell
    }
}
