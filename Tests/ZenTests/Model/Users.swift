//
//  Users.swift
//  
//
//  Created by KarimEbrahem on 7/20/20.
//

import Foundation

struct Users: Codable {
    var page: Int
    var per_page: Int
    var total: Int
    var total_pages: Int
    var data: [UserList]
    var ad: Ad
}

struct UserList: Codable {
    var id: Int
    var email: String
    var first_name: String
    var last_name: String
    var avatar: String
}

struct Ad: Codable {
    var company: String
    var url: String
    var text: String
}
