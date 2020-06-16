//
//  parseData.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 12.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class ParseData{
    
    func fetchingData(completion: @escaping(_ decodedData: CategoryData?, _ error: Error?) -> Void){
        
        guard let path = Bundle.main.path(forResource: "category", ofType: "json") else{return}
        let url = URL(fileURLWithPath: path)
        do{
            let data = try Data(contentsOf: url)
            let categories = try JSONDecoder().decode(CategoryData.self, from: data)
            completion(categories, nil)
        }catch{
            print("error: \(error )")
            completion(nil,error)
        }
    }
}
