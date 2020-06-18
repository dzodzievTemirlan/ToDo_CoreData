//
//  ViewController.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 09.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

let updateCollectionViewKey = "com.dztemirlan.DataFetched"

class FirstViewController: UIViewController {
    
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    
    
    var categories = [Category]()
    let firstStartService =  FirstStartService()
    let addViewController = AddTaskViewController()
    let collectionView = CollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewOutlet.register(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.collectionViewOutlet.dataSource = self.collectionView
        self.collectionViewOutlet.delegate = self.collectionView
        getData()
        updateCollectionViewNotification()
        collectionView.delegateVC = self
        paddindCells()
        customNavBar()
        customButton(addButton)
        //                print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    fileprivate func paddindCells() {
        if let layout = collectionViewOutlet.collectionViewLayout as? UICollectionViewFlowLayout{
            let padding:CGFloat = 20
            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 30
        }
    }
    fileprivate func updateCollectionViewNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateCollecctionView), name: Notification.Name(updateCollectionViewKey), object: nil)
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
        navigationController?.navigationBar.tintColor = .white
        
    }
    
    
    func getData(){
        firstStartService.fetchData { (category) in
            guard let allCategories = category else{return}
            self.categories = allCategories
            self.collectionView.items = self.categories
            NotificationCenter.default.post(name: Notification.Name(rawValue: updateCollectionViewKey), object: self)
            print("data get")
        }
        
    }
    
    @objc func updateCollecctionView(_ notification: Notification){
        collectionView.reloadData()
        print("Updated")
    }
}

extension FirstViewController: SecondViewControllerDelegate{
    func nextVC(_ collectionView: CollectionView, _ indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "OneCategoryStoryboard", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "TableView") as! OneCategoryViewController
        self.navigationController?.show(vc, sender: self )
        vc.categoryTitle = categories[indexPath.row].label
        vc.categoryimage = categories[indexPath.row].image!
        
    }
}



