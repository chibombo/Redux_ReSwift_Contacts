//
//  contactReducer.swift
//  ContentProviderSwift
//
//  Created by Luis Genaro Arvizu Vega on 20/10/17.
//  Copyright © 2017 iOS Profuturo. All rights reserved.
//

import Foundation
import ReSwift

func getContactInfo(action: Action, state: Contact_State?) -> Contact_State
{
    var state = state ?? Contact_State()
    
    switch action
    {
        case _ as pickContactName:            
            break
        case _ as pickContactNumber:
            break
    case _ as pickContactAllInfo:
        state.name = state.contacts[state.index].givenName
        state.number = state.contacts[state.index].familyName
        break
    default:
            break
    }

    return state
}
