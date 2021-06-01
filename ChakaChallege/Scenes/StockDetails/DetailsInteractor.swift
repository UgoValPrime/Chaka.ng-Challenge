//
//  DetailsInteractor.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//

import Foundation

protocol GetStockDetailsResponseBusinessLogic{
    func getStockDeatailsResponseData(url: String)
}

class GetStockDetailsInteractor: GetStockDetailsResponseBusinessLogic {
    
    var worker: GetStockDetailsResponse?
    var presenter: GetStockDetailsPresentationLogic?
    
    func getStockDeatailsResponseData(url: String) {
        worker?.getStockDetails(url: url, success: { [weak self] (response) in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.presentResponse(prompt: response)
            
        }, failure: {[weak self] (error) in
            guard let strongSelf = self else { return }
            strongSelf.presenter?.presentError(prompt: error)
        })
    }
}
