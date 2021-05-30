//
//  DetailsWorker.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//


import Foundation

protocol GetStockDetailsResponse {
    func getStockDetails(ticker: String, success: @escaping (StockDetailsModel) -> Void, failure: @escaping (String) -> Void)
}

class StockDetailsResponseWorker: GetStockDetailsResponse {
    
    var networkClient: ChakaApiClient?
    
    func getStockDetails(ticker: String, success: @escaping (StockDetailsModel) -> Void, failure: @escaping (String) -> Void) {
        networkClient?.execute( url: "https://api.polygon.io/v1/open-close/\(ticker)/2020-10-14?unadjusted=true&apiKey=bUy3ML7tgpRaXC96KVFPC8O2gjU6Als2", success: { (response) in
            success(response)
        }, failure:  { (error) in
            failure(error)
        })
    }
}
