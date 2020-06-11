//
//  TableViewCell.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 10.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var labletest: UILabel!
    
    var test: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        guard let test2 = test else {return}
        
        labletest.text = test2
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
