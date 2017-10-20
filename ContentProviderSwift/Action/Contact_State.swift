//
//  Contact_State.swift
//  ContentProviderSwift
//
//  Created by Luis Genaro Arvizu Vega on 20/10/17.
//  Copyright © 2017 iOS Profuturo. All rights reserved.
//

import Foundation
import ReSwift
import Contacts
struct Contact_State : StateType
{
    var name : String = ""
    var number : String = ""
    var index : Int = 0
    var contacts = [CNContact]()
}
