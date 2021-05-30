//
//  StockDetailsModel.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//

import Foundation

// MARK: - StockDetailsModel
struct StockDetailsModel: Codable {
    let status, from, symbol: String
    let welcomeOpen: Int
    let high, low, close: Double
    let volume: Int
    let afterHours, preMarket: Double

    enum CodingKeys: String, CodingKey {
        case status, from, symbol
        case welcomeOpen = "open"
        case high, low, close, volume, afterHours, preMarket
    }
}
