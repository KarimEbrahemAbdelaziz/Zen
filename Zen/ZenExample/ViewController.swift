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
        
        fetchTodos()
    }
    
    private func fetchTodos() {
        APIClient.fetchTodos { result in
            print(result)
        }
    }

}

