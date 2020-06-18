//
//  FirstStartService.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 17.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit
class FirstStartService{
    
    let parseData = ParseData()
    let coreDataManager = CoreDataManager()
    
    func firstStart(complition: @escaping (_ bool: Bool)-> Void){
        
        if UserDefaults.standard.bool(forKey: "isStarted") {
            print("App already started")
            complition(true)
        }else {
            UserDefaults.standard.set(true,forKey: "isStarted")
            parseData.fetchingData { (categoryData, error) in
                if error != nil{
                    print("error with parsing data")
                    complition(false)
                }else {
                    complition(true)
                    guard let lists = categoryData else {return}
                    for list in lists.Category{
                        self.coreDataManager.saveData(list)
                        print("saved data")
                    }
                    
                    
                }
            }
        }
    }
    
//    func fetchData(_ complitionHandler: @escaping((_ category: [Category]?) -> Void)){
//        firstStart { (bool) in
//            if bool{
//                self.coreDataManager.fetchCategories { (category, error) in
//                    guard let categories = category else {return}
//                    complitionHandler(categories)
//                    print("fetchData")
//
//                }
//            }
//        }
//
//    }
    
}

