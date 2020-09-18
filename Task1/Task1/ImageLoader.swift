//
//  ImageLoader.swift
//  Task1
//
//  Created by Elizaveta Shabalina on 18.09.2020.
//  Copyright © 2020 Elizaveta Shabalina. All rights reserved.
//

import UIKit

class ImageLoader: NSObject {
    static func loadImage(url: String, onComplete: @escaping (_ image: UIImage) -> Void, onError: @escaping (_ error: Error) -> Void) {
        guard let imageURL = URL(string: url) else { return }

        // Create dataTask
        // just not to cause a deadlock in UI!
        let task = URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else { onError(error!); return }
            let image = UIImage(data: data)

            DispatchQueue.main.async() {
                onComplete(image!)
            }
        }
        task.resume()
    }
}
