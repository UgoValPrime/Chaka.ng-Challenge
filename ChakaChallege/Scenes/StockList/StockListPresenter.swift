//
//  StockListPresenter.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//

import Foundation

protocol GetStockListPresentationLogic {
    
    func presentResponse (prompt: StockResponse)
    
    func presentError (prompt: String)
}

class GetStockListPresenter: GetStockListPresentationLogic {
   
    var view: GetStockListDisplayLogic?
    
    func presentResponse(prompt: StockResponse) {
        view?.displayResponse(prompt: prompt)
    }

    func presentError(prompt: String) {
        view?.displayError(prompt: prompt)
    }
}
