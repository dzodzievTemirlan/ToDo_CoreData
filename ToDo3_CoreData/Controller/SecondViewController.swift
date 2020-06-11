//
//  SecondViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 10.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableView: TableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.layer.cornerRadius = 20
    }
    


}
