//
//  Service.swift
//  CurrencyConverter
//
//  Created by Marcelo Silva on 27/06/22.
//

import Foundation

protocol CurrencyManagerDelegate{
    func didUpdateCurrency(currency:Currency)
    func didFailWithError(error:Error)
}

protocol CurrencyServiceProtocol {
    var delegate:CurrencyManagerDelegate? {get set}
    func fetchCurrency(_ from:String, _ to:String, _ amount:String)
}

enum Erro: Error {
    case genericError (String)
}

class CurrencyService: CurrencyServiceProtocol {
    var delegate: CurrencyManagerDelegate?
    
    let urlString = "https://api.exchangerate.host/convert?"
    
    func fetchCurrency(_ from:String, _ to:String, _ amount:String) {

        let url = "\(urlString)from=\(from)&to=\(to)&amount=\(amount)"
        self.getCurrency(with: url)
    }
    
    func getCurrency(with url:String) {
       
        guard let url: URL = URL(string: url) else {
            delegate?.didFailWithError(error: Erro.genericError("error url"))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { [self]data, response, error in
            guard let data = data else {
                self.delegate?.didFailWithError(error: Erro.genericError("error data"))
                return
            }

            let json = try? JSONSerialization.jsonObject(with: data)
            print(json as Any)
            guard let response = response as? HTTPURLResponse else {
                self.delegate?.didFailWithError(error: Erro.genericError("error response"))
                return
            }
            
            if response.statusCode == 200 {
                do {
                    let model:Currency = try JSONDecoder().decode(Currency.self, from: data)
                    delegate?.didUpdateCurrency(currency: model)
                } catch {
                    delegate?.didFailWithError(error: Erro.genericError("error parse"))
                    return
                }
            } else {
                delegate?.didFailWithError(error: Erro.genericError("error"))
                return
            }
        }
        task.resume()
    }
    
}

