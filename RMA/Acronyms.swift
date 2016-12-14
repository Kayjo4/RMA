//
//  Acronyms.swift
//  RMA
//
//  Created by Seth Rininger on 12/13/16.
//  Copyright © 2016 RMA. All rights reserved.
//

import Foundation

class Acronym: NSObject {
    
    enum AcronymType: Int {
        case computers
        case chat
        case math
        case games
        case funny
        case guesture
    }
    
    var type: AcronymType!
    var name: String!
    var definition: String!
    
    init(type: AcronymType, name: String, def: String) {
        self.type = type
        self.name = name
        self.definition = def
    }
}

class DummyData2 {
    var acronyms: [Acronym]!
    var types: [String] = ["Computers", "Chat", "Math", "Games", "Funny", "Guesture"]
    
    init() {
        acronyms = []
        acronyms.append(Acronym(type: .chat, name: "RMA", def: "Rate My Acronym"))
        acronyms.append(Acronym(type: .computers, name: "ACL", def: "Access Control List"))
        acronyms.append(Acronym(type: .computers, name: "BIOS", def: "Basic Input/Output System"))
        acronyms.append(Acronym(type: .computers, name: "BLOB", def: "Binary Large Object"))
        acronyms.append(Acronym(type: .computers, name: "BMP", def: "Bitmap"))
        acronyms.append(Acronym(type: .computers, name: "CAD", def: "Computer-Aided Design"))
        acronyms.append(Acronym(type: .computers, name: "CPM", def: "Cost Per 1,000 Impressions"))
        acronyms.append(Acronym(type: .computers, name: "CPU", def: "Central Processing Unit"))
        acronyms.append(Acronym(type: .computers, name: "DDR", def: "Double Data Rate"))
        acronyms.append(Acronym(type: .computers, name: "DLL", def: "Dynamic Link Library"))
        acronyms.append(Acronym(type: .computers, name: "SOAP", def: "Simple Object Access Protocol"))
        acronyms.append(Acronym(type: .computers, name: "SRAM", def: "Static Random Access Memory"))
        acronyms.append(Acronym(type: .computers, name: "UDP", def: "User Datagran Protocol"))
        acronyms.append(Acronym(type: .funny, name: "LOL", def: "Laugh Out Loud"))
        acronyms.append(Acronym(type: .funny, name: "ROFL", def: "Rolling On the Floor Laughing"))
        acronyms.append(Acronym(type: .guesture, name: "TTFN", def: "Ta Ta For Now"))
        acronyms.append(Acronym(type: .guesture, name: "BRB", def: "Be Right Back"))
        acronyms.append(Acronym(type: .guesture, name: "AFK", def: "Away From Keyboard"))
        acronyms.append(Acronym(type: .games, name: "FTW", def: "For The Win"))
        acronyms.append(Acronym(type: .games, name: "WTG", def: "Way To Go"))
        acronyms.append(Acronym(type: .games, name: "IAMF", def: "It's All My Fault"))
        acronyms.append(Acronym(type: .chat, name: "JK", def: "Just Kidding"))
        acronyms.append(Acronym(type: .chat, name: "IRL", def: "In Real Life"))
        
    }
    
    var computers: [Acronym] {
        return acronyms.filter { $0.type == .computers }
    }
    
    var funnnys: [Acronym] {
        return acronyms.filter { $0.type == .funny }
    }
    
    var guestures: [Acronym] {
        return acronyms.filter { $0.type == .guesture }
    }
    
    var chats: [Acronym] {
        return acronyms.filter { $0.type == .chat }
    }
    
    var games: [Acronym] {
        return acronyms.filter { $0.type == .games }
    }
    
    var maths: [Acronym] {
        return acronyms.filter { $0.type == .math }
    }
    
    func getAcronymType(type: Int) -> [Acronym] {
        switch type {
        case 0:
            return computers
        case 1:
            return chats
        case 2:
            return maths
        case 3:
            return games
        case 4:
            return funnnys
        case 5:
            return guestures
        default:
            return []
        }
    }
    
    var acronymTypeCount: Int {
        var count: Int = 0
        let thisArray = [computers, chats, maths, games, funnnys, guestures]
        for type in thisArray {
            if type.count > 0 {
                count += 1
            }
        }
        return count
    }
}
