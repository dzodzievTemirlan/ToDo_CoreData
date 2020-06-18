//
//  parseData.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 12.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class ParseData{


    func fetchingData(_ completion: @escaping(_ decodedData: CategoryData?, _ error: Error?) -> Void){
           
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
//    private let parseJsonDispatch = DispatchQueue(label: "com.dztemirlan.ParseJson", qos: .userInitiated, attributes: .concurrent)
//private let jsonFilepath = Bundle.main.path(forResource: "category", ofType: "json")
//
//   private func readFromJson(completion: @escaping(Data?,Error?) -> Void){
//        guard let path = jsonFilepath else{return}
//        let url = URL(fileURLWithPath: path)
//
//            do{
//                let data = try Data(contentsOf: url)
////                let categories = try JSONDecoder().decode(CategoryData.self, from: data)
//                completion(data, nil)
//            }catch{
//                print("error: \(error )")
//                completion(nil,error)
//
//            }
            
            
//        parseJsonDispatch.async(execute: parseQueue)
//          let parseQueue = DispatchWorkItem(qos: .userInitiated, flags: [.enforceQoS])
//    }
    
    
//    func fetchJson(complitionHandler: @escaping(_ category: CategoryData?, _ error: Error?) -> Void){
//
//        parseJsonDispatch.async {
//            self.readFromJson { (category, error) in
//                do{
//                    guard let data = category else{return}
//                    let categories = try JSONDecoder().decode(CategoryData.self, from: data)
//                    complitionHandler(categories,nil)
//                }catch{
//                    print("Error fetching Data")
//                    complitionHandler(nil,error)
//                }
//            }
//        }
//
//
//    }
    
//}
