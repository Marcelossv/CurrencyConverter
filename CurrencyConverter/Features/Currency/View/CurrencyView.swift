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
    func tappedCaculateButtonAction()
}

class CurrencyView: UIView {
    
    
    weak private var delegate: CurrencyViewProtocol?
    
    func delegate(delegate: CurrencyViewProtocol?) {
        self.delegate = delegate
    }

    lazy var labelApp: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "Currency Convert"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var firstCurrencyView: UIView = {
        let firstView = UIView()
        firstView.addSubview(valueFirstLabel)
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.backgroundColor = .white
        firstView.layer.cornerRadius = 8
        return firstView
    }()
    
    
    lazy var valueFirstLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "▽"
        
        label.numberOfLines = 0
        return label
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
        button.setImage(UIImage(named: "arrow4"), for:.normal )
        button.tintColor = UIColor.white
        button.addTarget(self, action: #selector(self.tappedbuttonSwipe), for: .touchUpInside)
        return button
    }()
    
    lazy var secondCurrencyView: UIView = {
        let secondView = UIView()
        secondView.addSubview(valueSecondLabel)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.backgroundColor = .white
        secondView.layer.cornerRadius = 8
        return secondView
    }()
    
    lazy var firstCurrencyTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.autocorrectionType = .no
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 8
        textField.layer.borderColor = CGColor(red: 55/255, green: 67/255, blue: 91/255, alpha: 1.0)
        textField.layer.borderWidth = 1.0
        textField.keyboardType = .default
        textField.placeholder = "Amount"
        textField.textColor = .darkGray
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        return textField
    }()

    
    lazy var valueSecondLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = "▽"
        label.textAlignment = .natural
        label.numberOfLines = 0
        return label
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
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 25)
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = UIColor.white
        button.backgroundColor = .orange
        button.setTitle("Calculate", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(self.tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    override init( frame: CGRect) {
        super.init(frame: frame)
        self.addSubView()
        self.setupConstraints()
        self.configBackGround()
        self.enableButton(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configBackGround() {
        self.backgroundColor = #colorLiteral(red: 0.1086915967, green: 0.1659173807, blue: 0.5, alpha: 1)
    }
    
    @objc private func tappedbuttonSwipe() {
        self.delegate?.tappedSwipeButtonAction()
    }
    
    @objc private func tappedCalculateButton() {
        self.delegate?.tappedCaculateButtonAction()
    }
    
    private func addSubView() {
        self.addSubview(self.labelApp)
        self.addSubview(self.firstCurrencyView)
        self.addSubview(self.swipeButton)
        self.addSubview(self.secondCurrencyView)
        self.addSubview(self.firstCurrencyTextField)
        self.addSubview(self.labelResult)
        self.addSubview(self.calculateButton)
}
    
    public func configtextFieldDelegateSignUp(delegate: UITextFieldDelegate) {
        self.firstCurrencyTextField.delegate = delegate
    }
    
    public func validateTextField() {
            if firstCurrencyTextField.text == ""{
                firstCurrencyTextField.layer.borderColor = UIColor.red.cgColor
                self.enableButton(false)
            } else {
                firstCurrencyTextField.layer.borderColor = UIColor.lightGray.cgColor
                    self.enableButton(true)
            }
        
    
    }

    private func enableButton(_ enable: Bool) {
        if enable {
            self.calculateButton.isEnabled = true
            self.calculateButton.setTitleColor(.white, for: .normal)
            } else {
            self.calculateButton.isEnabled = false
            self.calculateButton.setTitleColor(.lightGray, for: .normal)
            }
        }
    
    private func setupConstraints() {
        
        
        NSLayoutConstraint.activate([
            
            self.labelApp.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 5),
            self.labelApp.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.firstCurrencyView.topAnchor.constraint(equalTo: self.labelApp.bottomAnchor, constant: 60),
            self.firstCurrencyView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20),
            self.firstCurrencyView.trailingAnchor.constraint(equalTo: self.trailingAnchor,constant: -20),
            self.firstCurrencyView.heightAnchor.constraint(equalToConstant: 40),
            
            self.valueFirstLabel.centerYAnchor.constraint(equalTo: firstCurrencyView.centerYAnchor),
            self.valueFirstLabel.leadingAnchor.constraint(equalTo: self.firstCurrencyView.leadingAnchor, constant: 5),
            
            self.firstCurrencyTextField.topAnchor.constraint(equalTo: firstCurrencyView.bottomAnchor,constant: 10),
            self.firstCurrencyTextField.leadingAnchor.constraint(equalTo: self.firstCurrencyView.leadingAnchor),
            self.firstCurrencyTextField.trailingAnchor.constraint(equalTo: self.firstCurrencyView.trailingAnchor),
            self.firstCurrencyTextField.heightAnchor.constraint(equalToConstant: 40),
            
            
            self.swipeButton.topAnchor.constraint(equalTo: self.firstCurrencyTextField.bottomAnchor, constant: 20),
            self.swipeButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.swipeButton.heightAnchor.constraint(equalToConstant: 45),
            self.swipeButton.widthAnchor.constraint(equalToConstant: 45),
            
            self.secondCurrencyView.topAnchor.constraint(equalTo: self.swipeButton.bottomAnchor, constant: 20),
            self.secondCurrencyView.leadingAnchor.constraint(equalTo: self.firstCurrencyView.leadingAnchor),
            self.secondCurrencyView.trailingAnchor.constraint(equalTo: self.firstCurrencyView.trailingAnchor),
            self.secondCurrencyView.heightAnchor.constraint(equalToConstant: 40),
            
            self.valueSecondLabel.centerYAnchor.constraint(equalTo: secondCurrencyView.centerYAnchor),
            self.valueSecondLabel.leadingAnchor.constraint(equalTo: self.firstCurrencyView.leadingAnchor, constant: 5),
            
            
            self.labelResult.topAnchor.constraint(equalTo: self.secondCurrencyView.bottomAnchor,constant: 20),
            self.labelResult.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.calculateButton.topAnchor.constraint(equalTo: self.valueSecondLabel.bottomAnchor,constant: 90),
            self.calculateButton.leadingAnchor.constraint(equalTo: self.firstCurrencyView.leadingAnchor),
            self.calculateButton.trailingAnchor.constraint(equalTo: self.firstCurrencyView.trailingAnchor),
            self.calculateButton.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            
            
        ])
        
    }
}
