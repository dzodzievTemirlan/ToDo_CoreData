//
//  CoreDataManager.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 13.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    
    func saveData(_ list: Items){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        
        let category = Category(context: context)
        category.label = list.label
        category.image = list.image
        do{
            try context.save()
        }catch{
            print("error with saving data: \(error)")
        }
    }
    
    
    func fetchCoreData(completion: @escaping(_ category: [Category]?,_ error: Error?)-> Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let request: NSFetchRequest<Category> = Category.fetchRequest()
        request.returnsObjectsAsFaults = false
        do{
            let result = try context.fetch(request)
            completion(result, nil)
        }catch{
            print("error with fetching data from CoreData")
            completion(nil, error)
        }
    }
    
    
    func saveTask(_ name: String, _ date: Date, _ categoryName: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let taskCategory = CatTask(context: context)
        
        
        taskCategory.name = name
        taskCategory.date = date
        taskCategory.done = false
        
        
        fetchCoreData { (categories, error) in
            guard let unwrappedCategories = categories else{return}
            for category in unwrappedCategories where category.label == categoryName{
                taskCategory.parentCategory = category
            }
        }
        do{
            try context.save()
        }catch{
            print("Error save Task")
        }
        
    }
    
    func fetchTask(_ currentCategory: String?, complition: @escaping(_ tasks: [CatTask]?) -> Void){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        guard let currentCat = currentCategory else{return}
        let context = appDelegate.persistentContainer.viewContext
        
        if currentCat == "All"{
            let request: NSFetchRequest<CatTask> = CatTask.fetchRequest()
            do{
                let result = try context.fetch(request)
                complition(result)
            }catch{
                print("Error with fetching data")
            }
        }else{
            let request: NSFetchRequest<CatTask> = CatTask.fetchRequest()
            request.returnsObjectsAsFaults = false
            let predicate = NSPredicate(format: "parentCategory.label MATCHES %@", currentCat)
            request.predicate = predicate
            
            do{
                let result = try context.fetch(request)
                complition(result)
            }catch{
                print("Error with fetching data")
            }
        }
        
        
    }
    
    func checkBoxUpdate(_ task: CatTask, _ done: Bool, _ categoryName: String){
        
        fetchTask(categoryName) { (taskSet) in
            guard let taskList = taskSet else{return}
            for tskOne in taskList where tskOne == task{
                tskOne.setValue(done, forKey: "done")
                
                do{
                    try tskOne.managedObjectContext?.save()
                }catch{
                    print("Error save Task")
                }
            }
        }
        
    }
    func deleteTask(_ task:CatTask){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
             let context = appDelegate.persistentContainer.viewContext
        context.delete(task)
        do{
            try context.save()
        }catch{
            print("error with delete")
        }

    }
}
