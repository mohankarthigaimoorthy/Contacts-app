//
//  oneViewController.swift
//  pepole
//
//  Created by Mohan K on 21/02/23.
//

import UIKit
//protocol showDelegate {
//    func text (_ input : Contact?)
//}
class OneCell : UITableViewCell {
    
    var data : [Contact]?
//    var delegate : showDelegate?
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPosition: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userNumber: UILabel!
    @IBOutlet weak var editbtn: UIButton!

}

class oneViewController: UIViewController {
 
    var contacts : Contact?
//    var delegate : showDelegate?
    var delegat : TextDelegate?
    @IBOutlet weak var profileTable: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
    blink ()
   
    }
   
    func blink () {
        profileTable.dataSource = self
        profileTable.delegate = self
        DispatchQueue.main.async {
            self.profileTable.reloadData()
        }
    }
}

extension oneViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = profileTable.dequeueReusableCell(withIdentifier: "OneCell", for: indexPath) as! OneCell
            cell.userImage.image =  contacts?.photo
            cell.userName.text = contacts?.name
            cell.userPosition.text = contacts?.position
            cell.userEmail.text = contacts?.email
            cell.userNumber.text = contacts?.phone
//        delegate?.text(contacts)

            return cell
        }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "twoViewController", let   twoController = segue.destination as? twoViewController{
            twoController.delegate = self
            twoController.contacts = contacts
        }
    }
}

extension oneViewController: TextDelegate {
    
    func show(_ input: Contact?) {
//        delegate?.show(input)
        self.contacts = input
        self.profileTable.reloadData()
//        self.navigationController?.popViewController(animated: true)
    }

}
