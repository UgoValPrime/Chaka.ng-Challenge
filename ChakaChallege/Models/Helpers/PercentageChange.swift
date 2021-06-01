//
//  PercentageChange.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 01/06/2021.
//

import Foundation

class PercentageChange {
    func percentChange (open: Double, close: Double) -> Double {
        var difference: Double = 0.0
        var change: Double = 0.0
       
        difference = close - open
        
        change = difference / close
        
        return change
    }

}
