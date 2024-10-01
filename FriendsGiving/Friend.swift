//
//  Friend.swift
//  FriendsGiving
//
//  Created by GuitarLearnerJas on 30/9/2024.
//

import Foundation

struct Friend: Codable, Identifiable {
    var id: String?
    var name: String = ""
    var bringing: String = ""
    var notes: String = ""
    
}
