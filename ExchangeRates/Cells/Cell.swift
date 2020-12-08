//
//  Cell.swift
//  ExchangeRates
//
//  Created by Evgeniy Chernyshov on 02/12/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import UIKit



class Cell: UITableViewCell {

    var model: Model?
    
    @IBOutlet var valueLabel: UILabel!
    @IBOutlet var currencyType: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setCurrency(model: Model){
        valueLabel.text = model.currencyName
        currencyType.text = "\(model.currencyValue)"
    }
    
    
}
