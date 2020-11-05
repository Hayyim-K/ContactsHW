//
//  Model.swift
//  ContactsHW
//
//  Created by vitasiy on 04.11.2020.
//

struct Person {
    
    let name: String
    let surname: String
    let phone: String
    //знаю, что, вероятно, так делать было нельзя, но я решил вместо сочинения сделать красиво - понимание есть, т.о. все ок) 
    var email: String {
        name + "_" + surname + "@gmail.com"
    }
    var fullName: String {
        name + " " + surname
    }
    
    static func getData() -> [Person] {
        
        let data = DataManager()
        let names = Array(data.names)
        let surnames = Array(data.surnames)
        let phones = Array(data.phones)
        //        let email = Array(data.email)
        var persons = [Person]()
        for index in 0..<names.count {
            persons.append(Person(name: names[index],
                                  surname: surnames[index],
                                  phone: phones[index]))
        }
        return persons
    }
    
}
