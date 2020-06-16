//
//  PopUpViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 11.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addButton: UIButton!
    
    let test = ParseData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customAddButton()
        
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        
        let currentDate = datePicker.date
        let dateFormater = DateFormatter()
        dateFormater.timeZone = TimeZone(abbreviation: "MSK")
        dateFormater.locale = NSLocale.current
        dateFormater.dateFormat = "dd MMMM HH:mm"
        let strDate = dateFormater.string(from: currentDate)
        UserDefaults.standard.set(strDate, forKey: "currentDate")
        
//        let defaultDate = datePicker.date.description
//        UserDefaults.standard.set(defaultDate, forKey: "defaultDate")
        
        let name = Notification.Name(rawValue: datePickerKey)
        NotificationCenter.default.post(name: name, object: nil)
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    func customAddButton(){
        addButton.layer.cornerRadius = 7
    }
}
