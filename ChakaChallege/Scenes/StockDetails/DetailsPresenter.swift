//
//  DetailsPresenter.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//

import Foundation

protocol GetStockDetailsPresentationLogic {
    
    func presentResponse (prompt: StockDetailsModel)
    
    func presentError (prompt: String)
}

class GetStockDetailsPresenter: GetStockDetailsPresentationLogic {
   
    var view: GetStockDetailsDisplayLogic?
    
    func presentResponse(prompt: StockDetailsModel) {
        view?.displayResponse(prompt: prompt)
    }

    func presentError(prompt: String) {
        view?.displayError(prompt: prompt)
    }
}
