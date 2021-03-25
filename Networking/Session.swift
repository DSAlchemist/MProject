//
//  Session.swift
//  MProject
//
//  Created by Danil G. on 05.03.2021.
//

import Foundation

class Session {
    static let shared = Session()
    
    var token = ""
    var userId = Int()
    
    private init() {
        
    }
}
