//
//  Todo.swift
//  ZenExample
//
//  Created by Karim Ebrahem on 4/7/20.
//  Copyright © 2020 Karim Ebrahem. All rights reserved.
//

struct Todo: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
