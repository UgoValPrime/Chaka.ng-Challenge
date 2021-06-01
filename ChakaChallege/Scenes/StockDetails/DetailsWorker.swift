//
//  DetailsWorker.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//


import Foundation


protocol GetStockDetailsResponse {
    func getStockDetails(url: String, success: @escaping (StockDetailsModel) -> Void, failure: @escaping (String) -> Void)
}

class StockDetailsResponseWorker: GetStockDetailsResponse {
    
    var networkClient: ChakaApiClient?
    
    func getStockDetails(url: String, success: @escaping (StockDetailsModel) -> Void, failure: @escaping (String) -> Void) {
        networkClient?.execute( url: url, success: { (response) in
           
            success(response)
            
        }, failure:  { (error) in
            failure(error)
        })
    }
}
