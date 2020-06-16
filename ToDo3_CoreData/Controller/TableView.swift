//
//  TableView.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 10.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import CoreData

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource{
    
    let coreDataManager = CoreDataManager()
    
    var tasksLast: [CatTask]!
    var taskTitle: String?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksLast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath) as! TableViewCell
        cell.noteName.text = tasksLast[indexPath.row].name
        cell.dateLabel.text = dateFormater(task: tasksLast, indexPath)
        cell.taskNumber = tasksLast[indexPath.row]
        cell.categoryName = taskTitle
        cell.checkboxOutlet.setImage(UIImage(named: checkboxImage(tasksLast, indexPath)), for: .normal)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let titleTask = taskTitle else {return}
        coreDataManager.deleteTask(tasksLast[indexPath.row], titleTask)
        tableView.reloadData()
    }
    
   private func dateFormater(task: [CatTask],_ index: IndexPath)->String{
        guard let currentDate = task[index.row].date else{return "0"}
        let dateFormater = DateFormatter()
        dateFormater.timeZone = TimeZone(abbreviation: "MSK")
        dateFormater.locale = NSLocale.current
        dateFormater.dateFormat = "dd MMMM HH:mm"
        let strDate = dateFormater.string(from: currentDate)
        
        return strDate
    }
    
    private func checkboxImage(_ task: [CatTask], _ index: IndexPath) -> String{
        switch task[index.row].done {
        case true:
            return "check"
        case false:
            return "uncheck"
        }
        
        
    }
    
}
 
