//
//  Coffee.swift
//  CoffeeShop
//
//  Created by n.melendez.azocar on 12/16/20.
//  Copyright © 2020 nebraska. All rights reserved.
//

import Foundation


class Coffee {
    var price: Double
    
    init(price: Double) {
        self.price = price
    }
}

extension Coffee {
    
    func addMilk() {
        price += 1000
    }
    
    func removeMilk() {
        price -= 1000
    }
    
    func addCocoa() {
        price += 800
    }
    
    func removeCocoa() {
        price -= 800
    }
    
    func addWhip() {
        price += 900
    }
    
    func removeWhip() {
        price -= 900
    }
}
