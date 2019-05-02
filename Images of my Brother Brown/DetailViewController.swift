//
//  DetailViewController.swift
//  Images of my Brother Brown
//
//  Created by Johan Park on 4/30/19.
//  Copyright © 2019 Johan Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var selectedImage: String?
    var selectedPictureNumber = 0
    var totalPictureCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "This is image \(selectedPictureNumber) of \(totalPictureCount)"
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToDisplay = selectedImage {
            imageView.image = UIImage(named: "\(imageToDisplay)")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
}