//
//  ViewController.swift
//  Images of my Brother Brown
//
//  Created by Johan Park on 4/30/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Brown in Black & White"
        navigationController?.navigationBar.backgroundColor = UIColor.lightGray
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix("JPG") {
                pictures.append(item)
                pictures.sort()
            }
            print(pictures)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = pictures[index]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //try loading the destination view controller with identifier and typecasting it as DetailViewController
        if let destVC = storyboard?.instantiateViewController(withIdentifier: "Detail View Controller") as? DetailViewController {
            
            //if successful, load the appropriate data into the destVC properties
            destVC.selectedImage = pictures[indexPath.row]
            destVC.selectedPictureNumber = indexPath.row + 1
            destVC.totalPictureCount = pictures.count
            
            //push the destVC onto the navigation controller
            navigationController?.pushViewController(destVC, animated: true)
        }
    }

}

