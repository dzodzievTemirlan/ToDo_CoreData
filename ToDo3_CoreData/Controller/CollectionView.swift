//
//  CollectionView.swift
//  ToDo3_CoreData
//
//  Created by Temirlan Dzodziev on 09.06.2020.
//  Copyright © 2020 Temirlan Dzodziev. All rights reserved.
//

import UIKit

protocol NextVCDelegate {
    func nextVC(_ collectionView: CollectionView ,_ indexPath: IndexPath)
}

private let reuseIdentifier = "Cell"


class CollectionView: UICollectionView, UICollectionViewDataSource{
    var items: [Category]!
    let coreDataManager = CoreDataManager()
    var delegateVC: NextVCDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ReusableCell
        cell.categoryTitle.text = items[indexPath.row].label
        cell.categoryImage.image = UIImage(named: items[indexPath.row].image!)
        cell.backgroundColor = .white
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 10).cgPath
        cell.layer.shadowRadius = 5
        cell.layer.shadowOffset = .zero
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegateVC?.nextVC(self, indexPath)
    }
}
extension UICollectionView: UICollectionViewDelegateFlowLayout{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: collectionView.frame.width / 2.5, height: 175)
    }
}


