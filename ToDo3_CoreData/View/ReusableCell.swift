//
//  ReusableCell.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 09.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class ReusableCell: UICollectionViewCell{
    
    let image = UIImageView(frame: CGRect(x: 10, y: 20, width: 50, height: 50))
    let categoryTitle = UILabel(frame: CGRect(x: 13, y: 70, width: 50, height: 50))
    let countTask = UILabel(frame: CGRect(x: 13, y: 95, width: 50, height: 50))
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        reusecell()
        
    }
    
    
    fileprivate func reusecell() {
        categoryTitle.tintColor = .black
        categoryTitle.font = .boldSystemFont(ofSize: 16)
        countTask.tintColor = .black
        countTask.font = .systemFont(ofSize: 12)
        addSubview(categoryTitle)
        addSubview(countTask)
        addSubview(image)
        
    }
    
    
    
    
}


