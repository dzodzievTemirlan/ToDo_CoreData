//
//  ViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 09.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    let collectionView = CollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewOutlet.register(ReusableCell.self, forCellWithReuseIdentifier: "Cell")
        collectionViewOutlet.dataSource = collectionView
        collectionViewOutlet.delegate = collectionView
        paddindCells()
        customButton()
        customNavBar()
        
    }
    
    fileprivate func paddindCells() {
        if let layout = collectionViewOutlet.collectionViewLayout as? UICollectionViewFlowLayout{
            let padding:CGFloat = 20
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 30

        }
    }
    
    func customButton(){
        addButton.layer.cornerRadius = addButton.bounds.size.width / 2
        addButton.clipsToBounds = true
        addButton.layer.shadowOpacity = 1
        addButton.layer.shadowRadius = 3
        addButton.layer.shadowOffset = .zero
        addButton.layer.shadowPath = UIBezierPath(ovalIn: addButton.bounds).cgPath
    }
    func customNavBar(){
        
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        
        
    }
    
    
    
}


