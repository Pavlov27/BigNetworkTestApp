//
//  LoadingImageControllerNetworkManager.swift
//  BigNetworkTestApp
//
//  Created by Nikita Pavlov on 30.08.2020.
//  Copyright © 2020 Nikita Pavlov. All rights reserved.
//

import UIKit
// Прослойка между NetworkManager И vc
class LoadingImageViewModel {

    let url = "https://applelives.com/wp-content/uploads/2016/03/iPhone-SE-11.jpeg"
    var loadedImage = UIImage()

    func loadImage(completion: @escaping (_ image: UIImage?) -> ()) {
        NetworkManager.loadImage(url: url) { [weak self] (image) in
            self?.loadedImage = image ?? UIImage()
            completion(image)
        }
    }
}
