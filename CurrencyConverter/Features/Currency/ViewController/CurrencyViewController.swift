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
    
    override func loadView() {
        self.currency = CurrencyView()
        view = self.currency
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.firstViewShow()
        self.secondViewShow()
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

}

