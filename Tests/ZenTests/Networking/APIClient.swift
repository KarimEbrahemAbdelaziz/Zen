//
//  APIClient.swift
//  
//
//  Created by KarimEbrahem on 7/19/20.
//

import Foundation
import Zen

class APIClient {
    @ZenRequest<Todo>("https://jsonplaceholder.typicode.com/todos/")
    static var fetchTodo: Service<Todo>
}
