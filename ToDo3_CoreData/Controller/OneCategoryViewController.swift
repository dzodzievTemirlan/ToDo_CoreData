//
//  SecondViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 10.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

let updateTableViewKey = "com.dztemitlan.UpdateTableView"

class OneCategoryViewController: UIViewController{
    
    let firstViewController = FirstViewController()
    var categoryTitle: String?
    var categoryimage: String?
    let coreDataManager = CoreDataManager()
    let tableViewClass = TableView()
    let collectionViewCell = CollectionViewCell()
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var tableViewOutlet: TableView!
    @IBOutlet weak var categoryImageOutlet: UIImageView!
    @IBOutlet weak var categoryTitleOutlet: UILabel!
    @IBOutlet weak var addButtonOutlet: UIButton!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var taskCountOutlet: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headerTitles(categoryTitle, categoryimage)
        firstViewController.customButton(addButtonOutlet)
        tableViewOutlet.delegate = tableViewClass
        tableViewOutlet.dataSource = tableViewClass
        tableViewClass.taskTitle = categoryTitle
        guard let currentTitle = categoryTitleOutlet.text else {return}
        coreDataManager.fetchTask(currentTitle) { (tasks) in
            self.tableViewClass.tasksList = tasks
            
        }
        NotificationCenter.default.addObserver(self, selector: #selector(updateTable), name: Notification.Name(updateTableViewKey), object: nil)
        
    }
    
    
    func headerTitles(_ title: String?, _ image: String?){
        guard let titlelUnwraped = title else {return}
        guard let imageUnwraped = image else {return}
        categoryTitleOutlet.text = titlelUnwraped
        categoryImageOutlet.image = UIImage(named: "\(imageUnwraped)2")
        tableViewOutlet.layer.cornerRadius = 20
    }
    @objc func updateTable(_ notification: Notification){
        guard let currentTitle = categoryTitleOutlet.text else {return}
        coreDataManager.fetchTask(currentTitle) { (tasks) in
            self.tableViewClass.tasksList = tasks
        }
        tableViewOutlet.reloadData()
    }
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let destinationVC = storyboard.instantiateViewController(identifier: "addNewTask") as! AddTaskViewController
        destinationVC.titleLabel = categoryTitle
        navigationController?.show(destinationVC, sender: sender)

    }
}

