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
    
    var items = [Category]()
    let coreDataManager = CoreDataManager()
    let addViewController = AddViewController()
    let collectionView = CollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.register(ReusableCell.self, forCellWithReuseIdentifier: "Cell")
        collectionViewOutlet.dataSource = collectionView
        collectionViewOutlet.delegate = collectionView
        collectionView.delegateVC = self
        paddindCells()
        customButton(addButton)
        customNavBar()
        coreDataManager.fetchCoreData { (category, error) in
            if error != nil{
                print("Error with Fetchingdata")
            }else{
                self.items = category!
                self.collectionView.items = self.items
            }
        }
                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    fileprivate func paddindCells() {
        if let layout = collectionViewOutlet.collectionViewLayout as? UICollectionViewFlowLayout{
            let padding:CGFloat = 20
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 30
            
        }
    }
    
    func customButton(_ button: UIButton){
        button.layer.cornerRadius = button.bounds.size.width / 2
        button.clipsToBounds = true
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 3
        button.layer.shadowOffset = .zero
        button.layer.shadowPath = UIBezierPath(ovalIn: button.bounds).cgPath
        
    }
    func customNavBar(){
        navigationItem.title = "Lists"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
    }
    
}

extension ViewController: NextVCDelegate{
    func nextVC(_ collectionView: CollectionView, _ indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "TaskStroryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TableView") as! SecondViewController
        self.navigationController?.show(vc, sender: self )
        vc.catTitle = items[indexPath.row].label
        vc.catImage = items[indexPath.row].image!
    }
}



