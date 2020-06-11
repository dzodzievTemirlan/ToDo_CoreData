//
//  AddViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 11.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
 
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotification()
    }
    
    
    
    deinit {
        removeKeyboardNotification()
    }
    
    @IBAction func addDate(_ sender: UIButton) {
        
        
    }
    
    @IBAction func addCategory(_ sender: UIButton) {
        
    }
    
    @IBAction func addTask(_ sender: UIButton) {
        textField.resignFirstResponder()
    }
    
    func registerForKeyboardNotification(){
        
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    
    @objc func kbWillShow(_ notification: Notification){
        guard let userInfo = notification.userInfo else{print("error with userInfo"); return}
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height)
    }
    
    @objc func kbWillHide(){
        scrollView.contentOffset = CGPoint.zero
    }
    
    func removeKeyboardNotification(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func addButtonTitle(_ title: String?){
        guard let nonOptionalTitle = title else{return}
        dateButton.titleLabel?.text = nonOptionalTitle
    }
    
}
