//
//  ImageLoader.swift
//  Task1
//
//  Created by Elizaveta Shabalina on 18.09.2020.
//  Copyright © 2020 Elizaveta Shabalina. All rights reserved.
//

import UIKit

typealias OnComplete = (_ image: UIImage) -> Void

class ImageLoader: NSObject {
    static func loadImage(url: String, onComplete: @escaping OnComplete) {
        guard let imageURL = URL(string: url) else { return }

        // Create dataTask
        // just not to cause a deadlock in UI!
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { return }
            let image = UIImage(data: data)

            DispatchQueue.main.async() {
                onComplete(image!)
            }
        }
        task.resume()
    }
}
