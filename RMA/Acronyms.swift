//
//  Acronyms.swift
//  RMA
//
//  Created by Seth Rininger on 12/13/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import Foundation

class Acronyms: NSObject {
    
    enum AcronymType: Int {
        case computers
        case chat
        case math
        case games
        case fb
        case twitter
    }
    
    var type: AcronymType!
    var name: String!
    var definition: String!
}
