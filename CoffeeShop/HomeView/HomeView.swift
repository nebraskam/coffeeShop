//
//  HomeView.swift
//  CoffeeShop
//
//  Created by n.melendez.azocar on 12/16/20.
//  Copyright © 2020 nebraska. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewDelegate: class {
    func buyButtonTapped()
    func milkSwitchChanged(isOn: Bool)
    func cocoaSwitchChanged(isOn: Bool)
    func whipSwitchChanged(isOn: Bool)
}

class HomeView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Title", comment: "")
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        return label
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        let buttonText = NSLocalizedString("Buy", comment: "")
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(buttonText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        return button
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("Price", comment: "")
        return label
    }()
    
    let milkIngredientView: IngredientView = {
        let ingredientView = IngredientView()
        ingredientView.selectLabel.text = NSLocalizedString("Milk", comment: "")
        return ingredientView
    }()
    
    let cocoaIngredientView: IngredientView = {
        let ingredientView = IngredientView()
        ingredientView.selectLabel.text = NSLocalizedString("Cocoa", comment: "")
        return ingredientView
    }()
    
    let whipIngredientView: IngredientView = {
        let ingredientView = IngredientView()
        ingredientView.selectLabel.text = NSLocalizedString("Whip", comment: "")
        return ingredientView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    weak var delegate: HomeViewDelegate?
     
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupEvents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    private func setupView() {
        
        self.addSubview(titleLabel)
        self.addSubview(buyButton)
        self.addSubview(priceLabel)
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            self.titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            self.titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.priceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            self.priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.stackView.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 20),
            self.stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            self.buyButton.topAnchor.constraint(greaterThanOrEqualTo: stackView.bottomAnchor, constant: 40),
            self.buyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            self.buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
        self.stackView.addArrangedSubview(milkIngredientView)
        self.stackView.addArrangedSubview(cocoaIngredientView)
        self.stackView.addArrangedSubview(whipIngredientView)

    }
    
    func setupEvents() {
        self.buyButton.addTarget(self, action: #selector(self.buyButtonTapped), for: .touchDown)
        self.milkIngredientView.selectSwitch.addTarget(self, action: #selector(milkSwitchChanged), for: .valueChanged)
        self.cocoaIngredientView.selectSwitch.addTarget(self, action: #selector(cocoaSwitchChanged), for: .valueChanged)
        self.whipIngredientView.selectSwitch.addTarget(self, action: #selector(whipSwitchChanged), for: .valueChanged)

    }
    
    @objc func buyButtonTapped() {
        self.delegate?.buyButtonTapped()
    }
    
    @objc func milkSwitchChanged() {
        self.delegate?.milkSwitchChanged(isOn: milkIngredientView.selectSwitch.isOn)
    }
    
    @objc func cocoaSwitchChanged() {
        self.delegate?.cocoaSwitchChanged(isOn: cocoaIngredientView.selectSwitch.isOn)
    }
    
    @objc func whipSwitchChanged() {
        self.delegate?.whipSwitchChanged(isOn: whipIngredientView.selectSwitch.isOn)
    }

}
