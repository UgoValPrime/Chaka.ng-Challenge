//
//  StocksListWorker.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//

import Foundation

protocol GetStockResponse {
    func getStocks(success: @escaping (StockResponse) -> Void, failure: @escaping (String) -> Void)
}

class StockResponseWorker: GetStockResponse {
    
    var networkClient: ChakaApiClient?
    
    func getStocks(success: @escaping (StockResponse) -> Void, failure: @escaping (String) -> Void) {
        networkClient?.execute( url: "https://api.polygon.io/v2/reference/tickers?sort=ticker&perpage=1000&page=1&apiKey=bUy3ML7tgpRaXC96KVFPC8O2gjU6Als2", success: { (response) in
            success(response)
        }, failure:  { (error) in
            failure(error)
        })
    }
}

