//
//  StockListModel.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//

import Foundation

// MARK: - StockResponse
struct StockResponse: Codable {
    let page, perPage, count: Int
    let status: String
    let tickers: [Ticker]
}

// MARK: - Ticker
struct Ticker: Codable {
    let ticker, name: String
    let market: Market
    let locale: Locale
    let type: String?
    let currency: Currency
    let active: Bool
    let primaryExch, updated: String
    let codes: Codes?
    let url: String
}

// MARK: - Codes
struct Codes: Codable {
    let cik: String?
    let scfigi, cfigi, figi: String
    let figiuid: String?
}

enum Currency: String, Codable {
    case eur = "EUR"
    case usd = "USD"
}

enum Locale: String, Codable {
    case us = "US"
}

enum Market: String, Codable {
    case stocks = "STOCKS"
}
