//
//  NetworkManager.swift
//  BigNetworkTestApp
//
//  Created by Nikita Pavlov on 30.08.2020.
//  Copyright © 2020 Nikita Pavlov. All rights reserved.
//

import UIKit

class NetworkManager {

    static func loadImage(url: String, compeletion: @escaping (_ image: UIImage?) -> ()) {

        guard let url = URL(string: url) else { return }

        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    compeletion(image)
                }
            } else {
                compeletion(nil)
            }
        }.resume()
    }

    

}
