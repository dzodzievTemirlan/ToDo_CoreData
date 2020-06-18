//
//  ReusableCell.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 09.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell{
    
    let categoryImage = UIImageView(frame: CGRect(x: 10, y: 20, width: 50, height: 50))
    let categoryTitle = UILabel(frame: CGRect(x: 13, y: 70, width: 50, height: 50))
    let countTask = UILabel(frame: CGRect(x: 13, y: 95, width: 50, height: 50))
    var catTitle: String?
    var catImage: String?
    var countTasks: Int?
    
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        reusecell()
        guard let title = catTitle else{return}
        guard let image = catImage else {return}
        guard let count = countTasks else{return}
        
        categoryTitle.text = title
        categoryImage.image = UIImage(named: image)
        countTask.text = String("\(count) tasks")
    }
    
    fileprivate func reusecell() {
        categoryTitle.tintColor = .black
        categoryTitle.font = .boldSystemFont(ofSize: 16)
        countTask.tintColor = .black
        countTask.font = .systemFont(ofSize: 12)
        addSubview(categoryTitle)
        addSubview(countTask)
        addSubview(categoryImage)
    }
}


