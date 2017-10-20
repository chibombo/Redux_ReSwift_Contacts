//
//  ContactsInfo.swift
//  ContentProviderSwift
//
//  Created by Luis Genaro Arvizu Vega on 20/10/17.
//  Copyright © 2017 iOS Profuturo. All rights reserved.
//

import Foundation
import Contacts
class ContactsInfo
{
    let store = CNContactStore()
    
    //var allContacts = [CNContact]()
    
    private var allContacts = [CNContact]()
    
    func getAllContacts() -> [CNContact] {
        let keyToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName)]
        let request = CNContactFetchRequest(keysToFetch: keyToFetch)
        do {
            try store.enumerateContacts(with: request, usingBlock: { (contact, stop) in
                self.allContacts.append(contact)
            })
        } catch{
            print("No se puede traer todos los contactos")
        }
        return allContacts
    }
    
}
