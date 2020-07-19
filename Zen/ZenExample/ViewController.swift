//
//  ViewController.swift
//  ZenExample
//
//  Created by Karim Ebrahem on 4/7/20.
//  Copyright © 2020 Karim Ebrahem. All rights reserved.
//

import UIKit
import Zen

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchTodo()
    }
    
    private func fetchTodo() {
        try? APIClient.$fetchTodo
            .set(method: .get)
            .set(path: "1")
            .build()
        
        APIClient.fetchTodo { result in
            switch result {
            case .success(let todo):
                print(todo.title)
            case .failure(let error):
                print(error)
            }
        }
    }

}

