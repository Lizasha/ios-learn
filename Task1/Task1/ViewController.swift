//
//  ViewController.swift
//  Task1
//
//  Created by Elizaveta Shabalina on 09.09.2020.
//  Copyright © 2020 Elizaveta Shabalina. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let rowNumber = indexPath.row + 1 // row-index + 1
        
        let imageView = cell.contentView.subviews[0] as! UIImageView
        let imageUrl = "https://placehold.it/375x150?text=\(rowNumber)"
        
        // update the image url for reusable cell that is loading
        imageView.accessibilityIdentifier = imageUrl;
        
        downloadImage(url: imageUrl, cell: cell)

        return cell
    }
    
    func downloadImage(url: String, cell: UITableViewCell) {
        ImageLoader.loadImage(url: url) { (image: UIImage) in
            let imageView = cell.contentView.subviews[0] as! UIImageView;
            
            // Check if awaiting url has not changed, then update image
            if imageView.accessibilityIdentifier == url {
                imageView.image = image
            }
        }
    }
    
}



