//
//  TableViewCell.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 10.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let secondViewcontroller = SecondViewController()
    let coreDateManager = CoreDataManager()
    var taskNumber: CatTask?
    var categoryName: String?
    @IBOutlet weak var checkboxOutlet: UIButton!
    @IBOutlet weak var noteName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    @IBAction func checkbox(_ sender: UIButton) {
        
        guard let task = taskNumber else{return}
        guard let catName = categoryName else {return}
        if sender.isSelected == false{
            coreDateManager.checkBoxUpdate(task, true, catName)
            sender.isSelected = true
            NotificationCenter.default.post(name: Notification.Name(rawValue: updateTableViewKey), object: nil)
            
        }else{
            coreDateManager.checkBoxUpdate(task, false, catName)
            NotificationCenter.default.post(name: Notification.Name(rawValue: updateTableViewKey), object: nil)
            sender.isSelected = false
        }
    }
    
}
