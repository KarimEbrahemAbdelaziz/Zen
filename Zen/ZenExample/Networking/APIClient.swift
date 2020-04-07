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
    @GET<[Todo]>(url: "https://jsonplaceholder.typicode.com/todos")
    static var fetchTodos: Service<[Todo]>
}
