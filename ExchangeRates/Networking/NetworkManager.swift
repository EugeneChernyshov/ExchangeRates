//
//  NetworkManager.swift
//  ExchangeRates
//
//  Created by Evgeniy Chernyshov on 02/12/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private var baseURL = "https://bank.gov.ua/NBUStatService/v1/"
 
    func getAllCurrency(value: String, completion: (([Model]) -> Void)?) {
        AF.request(self.baseURL + value, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil).response
        { (responseData) in
            guard let data = responseData.data else {return}
            do {
                
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonArray = jsonResponse as? [Any], let results = jsonArray as? [[String: Any]] else { return }
                var currency = [Model]()
                results.forEach({ currency.append(Model(with: $0)) })
                completion?(currency)
//                completion?(currency.filter({ $0.currencyName == "USD" || $0.currencyName == "EUR" || $0.currencyName == "UAH" }))
            } catch {
                print("Error decoding == \(error)")
            }
        }
    }
}
