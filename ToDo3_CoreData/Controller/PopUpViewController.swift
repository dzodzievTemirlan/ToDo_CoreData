//
//  PopUpViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 11.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {
    
    let addViewController = AddViewController()
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var addButton: UIButton!
    
    var currentDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customAddButton()
        
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true) {
            self.currentDate = self.datePicker.date
//            guard let nonOptionalDate = self.currentDate?.description else{return}
            self.addViewController.addButtonTitle(self.currentDate?.description)
//            UserDefaults.standard.set(nonOptionalDate, forKey: "currentDate")
            
        }
        
    }
    
    
    func customAddButton(){
        
        addButton.layer.cornerRadius = 7
//        backView.layer.cornerRadius = 20
        
        
    }
    
    
}
