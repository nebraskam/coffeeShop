//
//  CoffeeShop.swift
//  CoffeeShop
//
//  Created by n.melendez.azocar on 12/16/20.
//  Copyright © 2020 nebraska. All rights reserved.
//

import Foundation

protocol Subject: class {
     func subscribe(_ subscribe: Subscribe)
     func unsubscribe(_ subscribe: Subscribe)
     func notify(coffee: Coffee)
}

protocol CoffeeShopProtocol: class {
    func addOrder(coffee: Coffee)
}

class CoffeeShop: Subject, CoffeeShopProtocol {
    
    private var subscribers: [Subscribe] = []
    private var orders: [Coffee] = [] {
        didSet {
            guard orders.count > 0 else { return }
            self.dispatchOrder()
        }
    }
    
    static let shared: CoffeeShop = CoffeeShop()
    private init() {}
    
    func subscribe(_ subscribe: Subscribe) {
        self.subscribers.append(subscribe)
    }
    
    func unsubscribe(_ subscribe: Subscribe) {
        //TODO: delete subscriber
    }
    
    func notify(coffee: Coffee) {
        self.subscribers.forEach {
            $0.update(coffee: coffee)
        }
    }
    
    func addOrder(coffee: Coffee) {
        orders.append(coffee)
    }
    
    private func dispatchOrder() {
        DispatchQueue.global().asyncAfter(deadline: .now() + .seconds(7)) {
            DispatchQueue.main.async {
                guard let coffee = self.orders.first else { return }
                self.notify(coffee: coffee)
                self.orders.remove(at: 0)
            }
        }
    }
}

protocol Subscribe {
    func update(coffee: Coffee)
}
