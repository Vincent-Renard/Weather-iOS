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

struct Donnee : Decodable {
    var name : String
    var main : Main
}
