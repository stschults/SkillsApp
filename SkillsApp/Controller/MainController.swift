//
//  ViewController.swift
//  SkillsApp
//
//  Created by Станислав Шульц on 01.08.2023.
//

import UIKit

class MainController: UIViewController {

    
    
    override func loadView() {
        super.loadView()
        view = ProfileView(frame: view.bounds)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
}

