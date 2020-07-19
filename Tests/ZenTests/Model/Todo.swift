//
//  Todo.swift
//  
//
//  Created by KarimEbrahem on 7/19/20.
//

import Foundation

struct Todo: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
