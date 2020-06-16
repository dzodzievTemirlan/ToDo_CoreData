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
        coreDataManager.fetchCoreData { (category, error) in
            if error != nil{
                print("error with fething category labels")
            }else{
                for i in 0...7{
                    guard let unwrappedLabel = category?[i].label else{return}
                    if unwrappedLabel == "All"{
                        continue
                    }else{
                        self.categoryLabels.append(unwrappedLabel)
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
        return 7
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categoryLabels[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let label = categoryLabels[row]
        UserDefaults.standard.set(label, forKey: "currentCategory")
    }
    
    
    
}

