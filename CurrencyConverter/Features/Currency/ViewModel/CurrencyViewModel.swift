//
//  CurrencyViewModel.swift
//  CurrencyConverter
//
//  Created by Marcelo Silva on 27/06/22.
//

import Foundation


class CurrencyViewModel {


    
    private let service: CurrencyService = CurrencyService()
    var currency: Double? = nil
    
    public func getCurrencyResquest(){
        
//        service.getCurrency {success, failure in
//            if let success = success {
//                self.currency = success
//                self.delegate?.success()
//            } else {
//                self.delegate?.error()
//            }
//        }
    }
    
    
}
