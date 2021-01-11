//
//  Coffee.swift
//  CoffeeShop
//
//  Created by n.melendez.azocar on 12/16/20.
//  Copyright © 2020 nebraska. All rights reserved.
//

import Foundation

protocol CoffeeExtra {
    func add()
    func remove()
}

class Coffee {
    var price: Double
    
    init(price: Double) {
        self.price = price
    }
}


class MilkCoffeeDecorator: CoffeeExtra {
    
    let coffee: Coffee
    private let extra: Double = 1000
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func add() {
        print("agrego milk")
        coffee.price += extra
    }
    
    func remove() {
        print("remuevo milk")
        coffee.price -= extra
    }
}


class CocoaCoffeeDecorator: CoffeeExtra {
    
    let coffee: Coffee
    private let extra: Double = 500
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func add() {
        print("agrego cocoa")
        coffee.price += extra
    }
    
    func remove() {
        print("remuevo cocoa")
        coffee.price -= extra
    }
}


class WhipCoffeeDecorator: CoffeeExtra {
    let coffee: Coffee
    private let extra: Double = 700
    
    init(coffee: Coffee) {
        self.coffee = coffee
    }
    
    func add(){
        print("agrego crema")
        coffee.price += extra
    }
    
    func remove() {
        print("remuevo crema")
        coffee.price -= extra
    }
}
