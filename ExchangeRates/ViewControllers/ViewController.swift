//
//  ViewController.swift
//  ExchangeRates
//
//  Created by Evgeniy Chernyshov on 02/12/2020.
//  Copyright © 2020 Evgeniy Chernyshov. All rights reserved.
//  Swift 5

import UIKit

class ViewController: UIViewController {

    var exchangeRates = [Model]()
    var stringResult: [String]?
    
//    var films = [Films]()
//    let results = jsonArray["results"]
//    results.forEach({ films.append(Films(with: $0)) })
//
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.getAllCurrency(value: "statdirectory/exchange?json") { exchangeRates in
            self.exchangeRates = exchangeRates
            self.tableView.reloadData()
        // Do any additional setup after loading the view.
    }
}
 
    @IBAction func pushConverter(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let viewController = mainStoryboard.instantiateViewController(withIdentifier: "ConverterViewController") as? ConverterViewController {
           exchangeRates.forEach { (Model) in
                viewController.currencyNames.append(Model.currencyName )
            }
            exchangeRates.forEach { (Model) in
                 viewController.currencyInt.append(Model.currencyValue )
             }
            viewController.currencyArray = exchangeRates
            viewController.modalPresentationStyle = .overCurrentContext
           // viewController.currencyNames = exchangeRates.first?.currencyName
           
           
            
          //  viewController.currencyInt == test?.currencyValue
           
            self.present(viewController, animated: false, completion: nil)
    }
        }
    
   
    }
   


extension ViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        exchangeRates.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell" , for: indexPath) as! Cell
        
        let currency = exchangeRates[indexPath.row]
        cell.setCurrency(model: currency)
//        let film = films[indexPath.row]
//        cell.setMovie(movie: film)
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
}
