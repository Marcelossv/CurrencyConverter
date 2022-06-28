//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Marcelo Silva on 22/06/22.
//
import DropDown
import UIKit

class CurrencyViewController: UIViewController {

    var currency: CurrencyView?
    let viewModel: CurrencyViewModel = CurrencyViewModel()
    var service: CurrencyServiceProtocol?
    var firstTypeCurrency: String = ""
    var secondTypeCurrency: String = ""
    
    
    override func loadView() {
        self.currency = CurrencyView()
        view = self.currency
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.currency?.delegate(delegate: self)
        self.firstViewShow()
        self.secondViewShow()
        self.setIndexFirstView()
        self.setIndexSecondView()
        self.service = CurrencyService()
        self.service?.delegate = self
    }


    @objc func didTapMenu() {
        currency?.menu.show()
        
    }
    
    @objc func didTapMenu2() {
        currency?.menu2.show()
    }
    
    func firstViewShow() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapMenu))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        currency?.firstCurrencyView.addGestureRecognizer(gesture)
        
        currency?.menu.anchorView = currency?.firstCurrencyView
       
    }
    
    func secondViewShow() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapMenu2))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        currency?.secondCurrencyView.addGestureRecognizer(gesture)
        
        currency?.menu2.anchorView = currency?.secondCurrencyView
    }
    
    func setIndexFirstView(){
        currency?.menu.selectionAction = {index, title in
            self.currency?.valueFirstLabel.text = title
            print ("\(index) \(title)")
            self.removeFirstFlag(title: title)
        }
        
    }
    
    func setIndexSecondView(){
        currency?.menu2.selectionAction = {index, title in
            self.currency?.valueSecondLabel.text = title
            print ("\(index) \(title)")
            self.removeSecondFlag(title: title)
        }
        
    }
    
    func removeFirstFlag(title:String) {
        firstTypeCurrency = title
        firstTypeCurrency.remove(at: firstTypeCurrency.startIndex)
        print (firstTypeCurrency)
    }
    
    func removeSecondFlag(title:String) {
        secondTypeCurrency = title
        secondTypeCurrency.remove(at: secondTypeCurrency.startIndex)
        print (secondTypeCurrency)
    }
    
    func makeRequest() {
        let value = firstTypeCurrency
        firstTypeCurrency = secondTypeCurrency
        secondTypeCurrency = value
        service?.fetchCurrency(firstTypeCurrency, secondTypeCurrency, self.currency?.firstCurrencyTextField.text ?? "")
    }

}

extension CurrencyViewController : CurrencyViewProtocol {
    func tappedCaculateButtonAction() {
        service?.fetchCurrency(firstTypeCurrency, secondTypeCurrency, self.currency?.firstCurrencyTextField.text ?? "")
    }
    
   
    func tappedSwipeButtonAction() {
        let value:String = currency?.valueFirstLabel.text ?? ""
        self.currency?.valueFirstLabel.text = self.currency?.valueSecondLabel.text
        self.currency?.valueSecondLabel.text = value
        self.makeRequest()
    }
}

extension CurrencyViewController: CurrencyManagerDelegate {
    func didUpdateCurrency(currency: Currency) {
        DispatchQueue.main.async {
            self.currency?.labelResult.text = String(format: "%.2f", currency.result)
        }
    }
    
    func didFailWithError(error: Error) {
        DispatchQueue.main.async {
            print(error)
        }
    }
    
    
    
    
}
