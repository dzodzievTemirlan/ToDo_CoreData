//
//  TableView.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 10.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class TableView: UITableView, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellReuse", for: indexPath) //as! TableViewCell
        
        cell.textLabel?.text = "qweqweqweqwe"
        
        return cell
    }
    

   

}
