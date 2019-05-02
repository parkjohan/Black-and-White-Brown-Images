//
//  CollectionViewController.swift
//  Images of my Brother Brown
//
//  Created by Johan Park on 5/2/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Item"

class CollectionViewController: UICollectionViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("JPG") {
                pictures.append(item)
                pictures.sort()
            }
        }
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.minimumInteritemSpacing = 5
    }

    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.imageView.image = UIImage(named: pictures[indexPath.item])
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let destVC = storyboard?.instantiateViewController(withIdentifier: "Detail View Controller") as? DetailViewController {
            destVC.selectedImage = pictures[indexPath.item]
            destVC.selectedPictureNumber = indexPath.item + 1
            destVC.totalPictureCount = pictures.count
            
            navigationController?.pushViewController(destVC, animated: true)
        }
    }

}
