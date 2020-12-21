//
//  OrderViewController.swift
//  CoffeeShop
//
//  Created by n.melendez.azocar on 12/16/20.
//  Copyright © 2020 nebraska. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    var orders: [Coffee] = [] {
        didSet {
            self.updateBadge()
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.dataSource = self
    }
    
    private func setupView() {
        navigationItem.title = "Ordenes" 
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func updateBadge() {
        self.tabBarItem.badgeValue = "\(orders.count)"
    }
}


extension OrderViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "exampleCell")
        let coffee = self.orders[indexPath.row]
        cell.textLabel?.text = "Orden #\(indexPath.row)"
        cell.detailTextLabel?.text = "Precio \(coffee.price)"
        return cell
    }
}


extension OrderViewController: Subscriber {
    func update(coffee: Coffee) {
        self.orders.append(coffee)
    }
}
