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
        }
        
    }
    
    func setIndexSecondView(){
        currency?.menu2.selectionAction = {index, title in
            self.currency?.valueSecondLabel.text = title
            print ("\(index) \(title)")
        }
        
    }

}

extension CurrencyViewController : CurrencyViewProtocol {
    func tappedCaculateButtonAction() {
        
    }
    
   
    func tappedSwipeButtonAction() {
        let value:String = currency?.valueFirstLabel.text ?? ""
        self.currency?.valueFirstLabel.text = self.currency?.valueSecondLabel.text
        self.currency?.valueSecondLabel.text = value
        self.viewModel.getCurrencyResquest()
    }
}

