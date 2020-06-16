//
//  AddViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 11.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

let datePickerKey = "com.dztemirlan.DatePickerKey"
let categoryPickerKey = "com.dztemirlan.CategoryPicker"
let categoryTitleKey = "com.dztemirlan.CategoryTitle"

class AddViewController: UIViewController {
    
    let datePickerName = Notification.Name(rawValue: datePickerKey)
    let categoryPickerName = Notification.Name(rawValue: categoryPickerKey)
    let categoryTitleName = Notification.Name(rawValue: categoryTitleKey)
    let categoryPopUp = CategoryPopUpViewController()
    let coreDataManager = CoreDataManager()
    var titleLabel : String?
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var addCategoryOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotification()
        chosenDate()
        chosenCategory()
        categoryButtonTitle()
        
    }
    deinit {
        removeNotification()
    }
    
    @IBAction func addDate(_ sender: UIButton) {
    }
    
    @IBAction func addCategory(_ sender: UIButton) {
    }
    
    @IBAction func createTask(_ sender: UIButton) {
        textField.resignFirstResponder()
        saveAction()
        navigationController?.popViewController(animated: true)
        NotificationCenter.default.post(name:Notification.Name(rawValue: updateTableViewKey), object: nil)
        
    }
    
    func saveAction(){
        guard !textField.text!.isEmpty else{showAlert("Add some note", nil);return}
        guard let name = textField.text else {return}
        guard let date = UserDefaults.standard.string(forKey: "currentDate") else{return}
        guard let category = UserDefaults.standard.string(forKey: "currentCategory") else{return}
        
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "MSK")
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "dd MMMM HH:mm"
        guard let dateUnwrapped = dateFormatter.date(from: date) else{return}
        coreDataManager.saveTask(name, dateUnwrapped, category)
    }
    
    func showAlert(_ title: String,_ message: String?){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    func registerForKeyboardNotification(){
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func chosenDate(){
        NotificationCenter.default.addObserver(self, selector: #selector(dateChoose), name: datePickerName, object: nil)
    }
    
    func chosenCategory(){
        NotificationCenter.default.addObserver(self, selector: #selector(categoryChoose), name: categoryPickerName, object: nil)
    }
    
    func categoryButtonTitle(){
        NotificationCenter.default.addObserver(self, selector: #selector(categoryTitle), name: categoryTitleName, object: nil)
    }
    
    
    
    @objc func kbWillShow(_ notification: Notification){
        guard let userInfo = notification.userInfo else{print("error with userInfo"); return}
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    
    @objc func kbWillHide(){
        scrollView.contentOffset = CGPoint.zero
    }
    
    @objc func dateChoose(_ notification: Notification){
        guard let currentButtonTitle = UserDefaults.standard.string(forKey: "currentDate") else{return}
        dateButton.setTitle(currentButtonTitle, for: .normal)
    }
    @objc func categoryChoose(_ notification: Notification){
        guard let currentButtonTitle = UserDefaults.standard.string(forKey: "currentCategory") else{return}
        addCategoryOutlet.setTitle(currentButtonTitle, for: .normal)
    }
    @objc func categoryTitle(_ notification: Notification){
        guard let title = titleLabel else {return}
        addCategoryOutlet.setTitle(title, for: .normal)
    }
    
    func removeNotification(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: datePickerName, object: nil)
        NotificationCenter.default.removeObserver(self, name: categoryPickerName, object: nil)
        NotificationCenter.default.removeObserver(self, name: categoryTitleName, object: nil)
    }
}

