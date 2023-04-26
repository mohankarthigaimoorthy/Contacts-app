//
//  twoViewController.swift
//  pepole
//
//  Created by Mohan K on 21/02/23.
//

import UIKit

extension String?{
    var orEmptyString:String{
        return self ?? ""
    }
}

protocol TextDelegate {
    func show(_ input: Contact?)
}

class EditCell : UITableViewCell{
    
    @IBOutlet weak var personImage: UIImageView!
    @IBOutlet weak var nameTxt : UITextField!
    @IBOutlet weak var positionTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var phoneTxt: UITextField!
    @IBOutlet weak var saveBtn: UIButton!

    var data: Contact?
    var delegate: TextDelegate?
    
    @IBAction func savebtn(_ sender: Any) {
        let contact = Contact(id: data?.id ?? 0,
                              photo: data?.photo ?? UIImage(),
                              name: nameTxt.text.orEmptyString,
                              position: positionTxt.text.orEmptyString,
                              email: emailTxt.text.orEmptyString,
                              phone: phoneTxt.text.orEmptyString)

        delegate?.show(contact)

    }
}


class twoViewController: UIViewController {

    var contacts : Contact?
    var delegate: TextDelegate?
    
    @IBOutlet weak var editContacts: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableview ()
    }
    
    func setupTableview () {
        editContacts.delegate = self
        editContacts.dataSource = self
        DispatchQueue.main.async {
            self.editContacts.reloadData()
        }
    }

    @IBAction func saveButn(_ sender: Any) {

    }
}

extension twoViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = editContacts.dequeueReusableCell(withIdentifier: "EditCell") as! EditCell
        cell.delegate = self
        cell.data = contacts
        cell.personImage.image = contacts?.photo
        cell.nameTxt.text = contacts?.name
        cell.positionTxt.text = contacts?.position
        cell.emailTxt.text = contacts?.email
        cell.phoneTxt.text = contacts?.phone
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800
    }
}



extension twoViewController: TextDelegate {
    
    func show(_ input: Contact?) {
        delegate?.show(input)
        self.navigationController?.popViewController(animated: true)
        
    }
}
