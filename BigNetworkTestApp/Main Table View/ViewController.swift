//
//  ViewController.swift
//  BigNetworkTestApp
//
//  Created by Nikita Pavlov on 30.08.2020.
//  Copyright © 2020 Nikita Pavlov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Tasks: String, CaseIterable {
        case downloadImage = "Download Image"
        case post = "Post"
        case get = "Get"
        case alamofire = "Alamofire"
    }
    var tasks = Tasks.allCases

    let tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupTableView()
    }

    func setupNavigationBar() {
        navigationItem.title = "Network Examples"
    }

    func setupTableView() {
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none

        tableView.delegate = self
        tableView.dataSource = self

        tableView.register(UINib(nibName: "MainTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MainTableViewCell
        cell?.mainTableViewCellLabel.text = tasks[indexPath.row].rawValue
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let task = tasks[indexPath.row]

        switch task{
            case .downloadImage:
                let newViewController = LoadImageController()
                self.navigationController?.pushViewController(newViewController, animated: true)
            case .post:
            print("post")
            case .get:
            print("get")
            case .alamofire:
            print("alamofire")
        }
    }
}

