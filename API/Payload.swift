//
//  Donnee.swift
//  API
//
//  Created by Ali ED-DBALI on 11/03/2021.
//

import Foundation

struct Main : Decodable {
    var temp : Double
}

struct Payload : Decodable {
    var name : String
    var main : Main
    var weather:[Weather]
    
}
struct Weather : Decodable {
    var id : Int
    var main : String
    var description : String
    var icon : String
    
}

