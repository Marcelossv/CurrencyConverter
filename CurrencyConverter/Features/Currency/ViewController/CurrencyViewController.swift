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
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapMenu))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        currency?.firstCurrencyView.addGestureRecognizer(gesture)
        
        currency?.menu.anchorView = currency?.firstCurrencyView
    }

  

    @objc func didTapMenu() {
        currency?.menu.show()
    }
    

}

