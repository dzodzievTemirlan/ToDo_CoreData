//
//  ReusableCell.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 09.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class ReusableCell: UICollectionViewCell{
    
    @IBOutlet weak var categoryTitle: UILabel!
    @IBOutlet weak var taskcount: UILabel!
    
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        label.tintColor = .black
        label.font = .systemFont(ofSize: 25)
        
        addSubview(label)
        
    }
    
    
    
    
    
    
    
}


