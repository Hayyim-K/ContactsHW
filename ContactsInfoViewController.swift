//
//  ContactsInfoViewController.swift
//  ContactsHW
//
//  Created by vitasiy on 04.11.2020.
//

import UIKit

class ContactsInfoViewController: UIViewController {
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var eMailLabel: UILabel!
    
    var persons: Person!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        phoneLabel.text = "Phone: \(persons.phone)"
        eMailLabel.text = "Email: \(persons.email)"
        title = persons.fullName
      
    }
    

}
