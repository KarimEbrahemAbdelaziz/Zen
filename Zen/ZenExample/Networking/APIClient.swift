//
//  APIClient.swift
//  ZenExample
//
//  Created by Karim Ebrahem on 4/7/20.
//  Copyright © 2020 Karim Ebrahem. All rights reserved.
//

import Foundation
import Zen

class APIClient {
    @ZenRequest<Todo>("https://jsonplaceholder.typicode.com/todos/")
    static var fetchTodo: Service<Todo>
}
