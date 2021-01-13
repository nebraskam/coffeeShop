//
//  HomeViewController.swift
//  CoffeeShop
//
//  Created by n.melendez.azocar on 12/16/20.
//  Copyright © 2020 nebraska. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let homeView = HomeView()
    var coffeeDraft = Coffee(price: 2000)
    let coffeeShop: CoffeeShopProtocol
    let priceText = NSLocalizedString("Price", comment: "")
    
    init(coffeeShop: CoffeeShopProtocol) {
        self.coffeeShop = coffeeShop
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updatePrice()
        homeView.delegate = self
    }
    
    func setupView() {
        view.addSubview(homeView)
        homeView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        navigationItem.title = NSLocalizedString("NavigationTitle", comment: "")
    }
    
    func updatePrice() {
        homeView.priceLabel.text = "\(priceText): \(coffeeDraft.price)"
    }
    
}

extension HomeViewController: HomeViewDelegate {
  
    func milkSwitchChanged(isOn: Bool) {
        let decorator = MilkCoffeeDecorator(coffee: coffeeDraft)
        if isOn {
            decorator.add()
        } else {
            decorator.remove()
        }
        
        updatePrice()
    }
    
    func cocoaSwitchChanged(isOn: Bool) {
        let decorator = CocoaCoffeeDecorator(coffee: coffeeDraft)

        if isOn {
            decorator.add()
        } else {
            decorator.remove()
        }
        updatePrice()
    }
    
    func whipSwitchChanged(isOn: Bool) {
        let decorator = WhipCoffeeDecorator(coffee: coffeeDraft)
        
        if isOn {
               decorator.add()
           } else {
               decorator.remove()
           }
           updatePrice()
    }
   
    func buyButtonTapped() {
        showBuyAlert()
        let orderCoffee = Coffee(price: coffeeDraft.price)
        coffeeShop.addOrder(coffee: orderCoffee)
    }
    
    private func showBuyAlert() {
        let alertTitle = NSLocalizedString("AlertTitle", comment: "")
        let alertMessage = NSLocalizedString("AlertMessage", comment: "")
        let alertButton = NSLocalizedString("AlertButton", comment: "")
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let doneButton = UIAlertAction(title: alertButton, style: .default)
        alert.addAction(doneButton)
        self.present(alert, animated: true)
    }
}
