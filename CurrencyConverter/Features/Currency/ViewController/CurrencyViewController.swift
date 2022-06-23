//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Marcelo Silva on 22/06/22.
//

import UIKit

class CurrencyViewController: UIViewController {

    var currency: CurrencyView?
    
    override func loadView() {
        self.currency = CurrencyView()
        view = self.currency
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}

