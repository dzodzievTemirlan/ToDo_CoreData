//
//  SecondViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 10.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

let updateTableViewKey = "com.dztemitlan.UpdateTableView"

class SecondViewController: UIViewController{
    
    let viewController = ViewController()
    var catTitle: String?
    var catImage: String?
    var tasksSet: [CatTask]?
    let coreDataManager = CoreDataManager()
    let tableViewClass = TableView()
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableViewOutlet: TableView!
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerTitles(catTitle, catImage)
        viewController.customButton(addButtonOutlet)
        tableViewOutlet.delegate = tableViewClass
        tableViewOutlet.dataSource = tableViewClass
        tableViewClass.taskTitle = catTitle
        guard let currentTitle = categoryTitle.text else {return}
        coreDataManager.fetchTask(currentTitle) { (tasks) in
            self.tableViewClass.tasksLast = tasks
        }
        NotificationCenter.default.addObserver(self, selector: #selector(updateTable), name: Notification.Name(updateTableViewKey), object: nil)
    }
    
    
    func headerTitles(_ label: String?, _ image: String?){
        
        guard let labelUnwraped = label else {return}
        guard let imageUnwraped = image else {return}
        
        categoryTitle.text = labelUnwraped
        categoryImage.image = UIImage(named: imageUnwraped)
        
        tableViewOutlet.layer.cornerRadius = 20
    }
    @objc func updateTable(_ notification: Notification){
        guard let currentTitle = categoryTitle.text else {return}
        coreDataManager.fetchTask(currentTitle) { (tasks) in
            self.tableViewClass.tasksLast = tasks
        }
        tableViewOutlet.reloadData()
        
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "addNewTask") as! AddViewController
        destinationVC.titleLabel = catTitle
        navigationController?.show(destinationVC, sender: sender)
        let name = Notification.Name(rawValue: categoryTitleKey)
        NotificationCenter.default.post(name: name, object: nil)
    }
}

