//
//  Main_ViewController.swift
//  ContentProviderSwift
//
//  Created by Luis Genaro Arvizu Vega on 20/10/17.
//  Copyright © 2017 iOS Profuturo. All rights reserved.
//

import UIKit
import ReSwift
import Contacts
class Main_ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StoreSubscriber {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameContact: UILabel!
    
    @IBOutlet weak var numberContact: UILabel!
    
    typealias StoreContactStateType = Contact_State
    
    //let store = CNContactStore()
    
    
    var allContacts = [CNContact]()
    let getContacts = ContactsInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allContacts = getContacts.getAllContacts()
        tableView.dataSource = self
        tableView.delegate = self
        contactStore.subscribe(self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.textLabel?.text = allContacts[indexPath.row].givenName + " " + allContacts[indexPath.row].familyName
        return cell
    }
    
    func newState(state: Contact_State)
    {
        nameContact.text = contactStore.state.name
        numberContact.text = contactStore.state.number
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contactStore.state.contacts = allContacts
        contactStore.state.index = indexPath.row
        contactStore.dispatch(pickContactAllInfo())
    }
    
//    func getAllContacts() -> Void {
//        let keyToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
//        let request = CNContactFetchRequest(keysToFetch: keyToFetch)
//        do {
//            try store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
//                self.allContacts.append(contact)
//            })
//        } catch{
//            print("No se puede traer todos los contactos")
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
