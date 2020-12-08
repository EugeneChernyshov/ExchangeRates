//
//  Model.swift
//  ExchangeRates
//
//  Created by Evgeniy Chernyshov on 02/12/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import Foundation
import UIKit

struct Model: Codable {
 
    var currencyValue: Double
    var currencyName: String
    
    init(with exchangeDictionary: [String: Any]) {
        currencyName = exchangeDictionary["cc"] as? String ?? ""
        currencyValue = exchangeDictionary["rate"] as? Double ?? 0
    }
    
}

