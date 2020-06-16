//
//  DataModel.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 12.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import Foundation

struct CategoryData: Codable{
    let Category: [Items]
}

struct Items: Codable{
    let label: String
    let image: String
}
