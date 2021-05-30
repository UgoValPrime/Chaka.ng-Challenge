//
//  StockListInteractor.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//

import Foundation

protocol GetStockResponseBusinessLogic{
    func getStockResponseData()
}

class GetStockListInteractor: GetStockResponseBusinessLogic {
    
    var worker: GetStockResponse?
    var presenter: GetStockListPresentationLogic?
    
    func getStockResponseData() {
        worker?.getStocks(success: { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.presentResponse(prompt: response)
            
        }, failure: {[weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.presentError(prompt: error)
        })
    }
}
