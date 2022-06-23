//
//  CurrencyView.swift
//  CurrencyConverter
//
//  Created by Marcelo Silva on 22/06/22.
//

import UIKit
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
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = "Currency Convert"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var firstCurrencyView: UIView = {
        let firstView = UIView()
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = .cyan
        return firstView
    }()

    lazy var swipeButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.up.arrow.down.circle"), for:.normal )
        button.addTarget(self, action: #selector(self.tappedbuttonSwipe), for: .touchUpInside)
        return button
    }()
    
    lazy var secondCurrencyView: UIView = {
        let secondView = UIView()
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.backgroundColor = .cyan
        return secondView
    }()
    
    lazy var labelResult: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = ""
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
        self.backgroundColor = .systemIndigo
    }
    
    @objc private func tappedbuttonSwipe() {
        self.delegate?.tappedSwipeButtonAction()
    }
    
    private func addSubView() {
        self.addSubview(self.labelApp)
        self.addSubview(self.firstCurrencyView)
        self.addSubview(self.swipeButton)
        self.addSubview(self.secondCurrencyView)
        self.addSubview(self.labelResult)
}
    
    private func setupConstraints() {
        
    
    NSLayoutConstraint.activate([
    
        self.labelApp.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 20),
        self.labelApp.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
        self.firstCurrencyView.topAnchor.constraint(equalTo: self.labelApp.bottomAnchor, constant: 20),
        self.firstCurrencyView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
        self.firstCurrencyView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
        self.firstCurrencyView.heightAnchor.constraint(equalToConstant: 40),
        
        self.swipeButton.topAnchor.constraint(equalTo: self.firstCurrencyView.bottomAnchor, constant: 20),
        self.swipeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
        self.swipeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
        self.swipeButton.heightAnchor.constraint(equalToConstant: 20),
        
        self.secondCurrencyView.topAnchor.constraint(equalTo: self.swipeButton.bottomAnchor, constant: 20),
        self.secondCurrencyView.leadingAnchor.constraint(equalTo: self.firstCurrencyView.leadingAnchor),
        self.secondCurrencyView.trailingAnchor.constraint(equalTo: self.firstCurrencyView.trailingAnchor),
        self.secondCurrencyView.heightAnchor.constraint(equalToConstant: 40),
        
        self.labelApp.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: 20),
        self.labelApp.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
        
    
    ])
    
}
}
