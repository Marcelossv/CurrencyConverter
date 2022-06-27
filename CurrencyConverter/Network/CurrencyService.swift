//
//  Service.swift
//  CurrencyConverter
//
//  Created by Marcelo Silva on 27/06/22.
//

import Foundation

protocol ServiceDelegate: GenericService {
    func getCurrency(completion: @escaping completion<Currency?>)
}

class CurrencyService: ServiceDelegate {
    func getCurrency(completion: @escaping completion<Currency?>) {
        let urlString = "https://api.exchangerate.host/convert?from=USD&to=EUR&amount=1200"
        
        guard let url: URL = URL(string: urlString) else {
            return completion(nil, Error.errorDescription(message: "Error Url"))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {data, response, error in
            guard let data = data else {
                return completion(nil, Error.errorDescription(message: "Error data"))
            }

            _ = try? JSONSerialization.jsonObject(with: data)
            
            guard let response = response as? HTTPURLResponse else {
                return completion(nil, Error.errorDescription(message: "Error data"))
            }
            
            if response.statusCode == 200 {
                do {
                    let model:Currency = try JSONDecoder().decode(Currency.self, from: data)
                } catch {
                    return completion(nil, Error.errorDescription(message: "Error parse", error: error))
                }
            } else {
                return completion(nil, Error.errorDescription(message: "Error", error: error))
            }
        }
        task.resume()
    }
    
    
    
}
