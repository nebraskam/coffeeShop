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
    var coffee = Coffee(price: 2000)
    let coffeeShop: CoffeeShopProtocol
    
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
        
        navigationItem.title = "Coffee shop"
    }
    
    func updatePrice() {
        homeView.priceLabel.text = "Precio: \(coffee.price)"
    }
    
}

extension HomeViewController: HomeViewDelegate {
  
    func milkSwitchChanged(isOn: Bool) {
        if isOn {
            coffee.addMilk()
        } else {
            coffee.removeMilk()
        }
        
        updatePrice()
    }
    
    func cocoaSwitchChanged(isOn: Bool) {
        if isOn {
            coffee.addCocoa()
        } else {
            coffee.removeCocoa()
        }
        updatePrice()
    }
    
    func whipSwitchChanged(isOn: Bool) {
        if isOn {
            coffee.addWhip()
        }else {
            coffee.removeWhip()
        }
        updatePrice()
    }
   
    func buyButtonTapped() {
        showBuyAlert()
        coffeeShop.addOrder(coffee: coffee)
    }
    
    private func showBuyAlert() {
        let alert = UIAlertController(title: "Compra procesada", message: "Te notificaremos cuando se encuentre lista", preferredStyle: .alert)
        let doneButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(doneButton)
        self.present(alert, animated: true)
    }
}
