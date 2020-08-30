//
//  LoadImageController.swift
//  BigNetworkTestApp
//
//  Created by Nikita Pavlov on 30.08.2020.
//  Copyright © 2020 Nikita Pavlov. All rights reserved.
//

import UIKit

class LoadImageController: UIViewController {

    var viewModel = LoadingImageViewModel()

    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private var loadImageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Load Image", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loadImageButtonTapped), for: .touchUpInside)
        return button
    }()

    private var activityIndicator: UIActivityIndicatorView = {
        let pv = UIActivityIndicatorView()
        pv.translatesAutoresizingMaskIntoConstraints = false
        pv.isHidden = true
        pv.hidesWhenStopped = true
        return pv
    }()

    override func viewDidLoad() {
        view.backgroundColor = .red
        setupImageView()
        setupLoadImageButton()
        setupActivityIndicator()
    }

    private func setupImageView() {
        view.addSubview(imageView)

        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupLoadImageButton() {
        view.addSubview(loadImageButton)

        loadImageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadImageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    private func setupActivityIndicator() {
        imageView.addSubview(activityIndicator)

        activityIndicator.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
    }

    @objc func loadImageButtonTapped() {
        loadImageButton.isHidden = true
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()

        viewModel.loadImage { [weak self] (image) in
            self?.imageView.image = image
            self?.activityIndicator.stopAnimating()
        }
    }
}
