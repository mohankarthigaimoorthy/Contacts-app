//
//  ViewController.swift
//  pepole
//
//  Created by Mohan K on 21/02/23.
//

import UIKit

struct Contact {
    var id  : Int
    var photo: UIImage
    var name : String
    var position : String
    var email : String
    var phone : String
}

class ContactCell : UITableViewCell {
    
    var data : [Contact]?
    var delegate : TextDelegate?

    @IBOutlet weak var imagecontact: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var positionLbl: UILabel!
    
}
class ViewController: UIViewController  {
    
    
  
    
    @IBOutlet weak var contactTabelView: UITableView!
    
var contacts = [  Contact(id: 1, photo: UIImage(named: "con1")!, name: "mohan", position: "salesrepresentative", email: "mohan@sampleemail.com", phone: "9876543201"),
                  Contact(id: 2, photo: UIImage(named: "con2")!, name: "amar", position: "product manager", email: "amar@sampleemail.com", phone: "8739392878"),
                  Contact(id: 3, photo: UIImage(named: "con3")!, name: "pavi", position: "intern trainee", email: "pavi@sampleemail.com", phone: "8935475958"),
                  Contact(id: 4, photo: UIImage(named: "con4")!, name: "mathi", position: "software developer", email: "mathi@sampleemail.com", phone: "7456573737"),
                  Contact(id: 5, photo: UIImage(named: "con5")!, name: "praveen", position: "senior developer", email: "praaveen@sampleemail.com", phone: "8377474747") ,
                ]
    
    var selectedContact : Contact?
    var delegate : TextDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
        star()
    }

    func star () {
        contactTabelView.delegate = self
        contactTabelView.dataSource = self
        DispatchQueue.main.async {
            self.contactTabelView.reloadData()
        }
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = contactTabelView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as? ContactCell
        cell?.imagecontact.image = contacts[indexPath.row].photo
        cell?.nameLbl.text = contacts[indexPath.row].name
        cell?.positionLbl.text = contacts[indexPath.row].position
//        cell?.delegate = self
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedContact = contacts[indexPath.row]
    
        self.performSegue(withIdentifier: "my", sender: self)
        DispatchQueue.main.async{
            self.contactTabelView.reloadData()
        }
       
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if segue.identifier == "my" {
            let viewController = segue.destination as! oneViewController
//            viewController.delegate = self
            viewController.contacts = selectedContact
        }
    }
}

extension ViewController: TextDelegate {
    func show(_ input: Contact?) {
        self.selectedContact = input
        self.contactTabelView.reloadData()
    }
    
    
}
//
//extension ViewController: showDelegate {
//
//    func text(_ input: Contact?) {
//        self.selectedContact = input
//        DispatchQueue.main.async {
//            self.contactTabelView.reloadData()
//
//        }
//    }
//

