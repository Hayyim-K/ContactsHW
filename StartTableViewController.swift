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
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)
        
        let content = persons[indexPath.row]
        cell.textLabel?.text = content.fullName
        return cell
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
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
