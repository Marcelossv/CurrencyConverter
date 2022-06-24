//
//  CurrencyView.swift
//  CurrencyConverter
//
//  Created by Marcelo Silva on 22/06/22.
//

import UIKit
import DropDown

protocol CurrencyViewProtocol : AnyObject {
    func tappedSwipeButtonAction()
}

class CurrencyView: UIView {
    
    weak private var delegate: CurrencyViewProtocol?
    
    func delegate(delegate: CurrencyViewProtocol?) {
        self.delegate = delegate
    }

    lazy var labelApp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 32)
        label.text = "Currency Convert"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var firstCurrencyView: UIView = {
        let firstView = UIView()
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = .white
        return firstView
    }()
    
    let menu:DropDown = {
        let menu = DropDown()
        menu.textFont = UIFont.systemFont(ofSize: 20)
        menu.dataSource = [
            "🇦🇺AUD", "🇧🇷BRL", "🇨🇦CAD", "🇪🇺EUR", "🇬🇧GBP", "🇯🇵JPY", "🇺🇸USD"
        ]
        return menu
    }()

    lazy var swipeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.up.arrow.down.circle"), for:.normal )
        button.addTarget(self, action: #selector(self.tappedbuttonSwipe), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    lazy var secondCurrencyView: UIView = {
        let secondView = UIView()
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.backgroundColor = .white
        return secondView
    }()
    
    let menu2:DropDown = {
        let menu = DropDown()
        menu.textFont = UIFont.systemFont(ofSize: 20)
        menu.dataSource = [
            "🇦🇺AUD", "🇧🇷BRL", "🇨🇦CAD", "🇪🇺EUR", "🇬🇧GBP", "🇯🇵JPY", "🇺🇸USD"
        ]
        return menu
    }()
    
    
    lazy var labelResult: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "test"
        label.numberOfLines = 0
        return label
    }()
    
    override init( frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.setupConstraints()
        self.configBackGround()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
    }
    
    @objc private func tappedbuttonSwipe() {
        self.delegate?.tappedSwipeButtonAction()
    }
    
    private func addSubView() {
        self.addSubview(self.labelApp)
        self.addSubview(self.firstCurrencyView)
        self.addSubview(self.menu)
        self.addSubview(self.swipeButton)
        self.addSubview(self.secondCurrencyView)
//        self.addSubview(self.menu2)
        self.addSubview(self.labelResult)
}
    
    private func setupConstraints() {
        
    
    NSLayoutConstraint.activate([
    
        self.labelApp.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 10),
        self.labelApp.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
        self.firstCurrencyView.topAnchor.constraint(equalTo: self.labelApp.bottomAnchor, constant: 50),
        self.firstCurrencyView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
        self.firstCurrencyView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
        self.firstCurrencyView.heightAnchor.constraint(equalToConstant: 40),
        
        self.swipeButton.topAnchor.constraint(equalTo: self.firstCurrencyView.bottomAnchor, constant: 20),
        self.swipeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        self.swipeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
        self.swipeButton.heightAnchor.constraint(equalToConstant: 60),

        self.secondCurrencyView.topAnchor.constraint(equalTo: self.swipeButton.bottomAnchor, constant: 20),
        self.secondCurrencyView.leadingAnchor.constraint(equalTo: self.firstCurrencyView.leadingAnchor),
        self.secondCurrencyView.trailingAnchor.constraint(equalTo: self.firstCurrencyView.trailingAnchor),
        self.secondCurrencyView.heightAnchor.constraint(equalToConstant: 40),

        self.labelResult.topAnchor.constraint(equalTo: self.secondCurrencyView.bottomAnchor,constant: 20),
        self.labelResult.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
        
    
    ])
    
}
}
