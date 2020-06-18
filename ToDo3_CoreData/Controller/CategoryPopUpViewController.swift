//
//  CategoryPopUpViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 15.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit


class CategoryPopUpViewController: UIViewController {
    var categoryLabels = [String]()
    let coreDataManager = CoreDataManager()
    @IBOutlet weak var categoryPicker: UIPickerView!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        customAddButton()
        coreDataManager.fetchCategories { (category, error) in
            if error != nil{
                print("error with fething category labels")
            }else{
                guard let count = category?.count else{return}
                for i in 0..<count{
                    guard let unwrappedCategory = category?[i].label else{return}
                    if unwrappedCategory == "All"{
                        continue
                    }else{
                        self.categoryLabels.append(unwrappedCategory)
                    }
                }
            }
        }
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        
        let name = Notification.Name(rawValue: categoryPickerKey)
        NotificationCenter.default.post(name: name, object: nil)
        
        dismiss(animated: true, completion: nil)
        
    }
    func customAddButton(){
        addButtonOutlet.layer.cornerRadius = 7
    }
}

extension CategoryPopUpViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categoryLabels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryLabels[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let label = categoryLabels[row]
        UserDefaults.standard.set(label, forKey: "currentCategory")
    }
    
    
    
}

