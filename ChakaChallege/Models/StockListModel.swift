//
//  StockListModel.swift
//  ChakaChallege
//
//  Created by  Ugo  Val on 30/05/2021.
//

//import Foundation
//
//// MARK: - StockResponse
//struct StockResponse: Codable {
//    let page, perPage, count: Int
//    let status: String
//    let tickers: [Ticker]
//}
//
//// MARK: - Ticker
//struct Ticker: Codable {
//    let ticker, name: String
//    let market: Market
//    let locale: Locale
//    let type: String?
//    let currency: Currency
//    let active: Bool
//    let primaryExch, updated: String
//    let codes: Codes?
//    let url: String
//}
//
//// MARK: - Codes
//struct Codes: Codable {
//    let cik: String?
//    let scfigi, cfigi, figi: String
//    let figiuid: String?
//}
//
//enum Currency: String, Codable {
//    case eur = "EUR"
//    case usd = "USD"
//}
//
//enum Locale: String, Codable {
//    case us = "US"
//}
//
//enum Market: String, Codable {
//    case stocks = "STOCKS"
//}





import Foundation

// MARK: - Welcome
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
    let type: TypeEnum?
    let currency: Currency
    let active: Bool
    let primaryExch: PrimaryExch?
    let updated: String
    let codes: Codes?
    let url: String
}

// MARK: - Codes
struct Codes: Codable {
    let cik, scfigi, cfigi, figi: String?
    let figiuid: String?
}

enum Currency: String, Codable {
    case aud = "AUD"
    case bdt = "BDT"
    case cad = "CAD"
    case chf = "CHF"
    case eur = "EUR"
    case gbp = "GBP"
    case gbx = "GBX"
    case hkd = "HKD"
    case idr = "IDR"
    case ils = "ILS"
    case jod = "JOD"
    case jpy = "JPY"
    case kwf = "KWF"
    case mad = "MAD"
    case omr = "OMR"
    case pen = "PEN"
    case pln = "PLN"
    case rsd = "RSD"
    case sek = "SEK"
    case thb = "THB"
    case twd = "TWD"
    case usd = "USD"
}

enum Locale: String, Codable {
    case us = "US"
}

enum Market: String, Codable {
    case stocks = "STOCKS"
}

enum PrimaryExch: String, Codable {
    case amx = "AMX"
    case arca = "ARCA"
    case bats = "BATS"
    case cvem = "CVEM"
    case grey = "GREY"
    case nasdaq = "NASDAQ"
    case ndd = "NDD"
    case ngs = "NGS"
    case nsc = "NSC"
    case nsd = "NSD"
    case nye = "NYE"
    case otc = "OTC"
    case otcqb = "OTCQB"
    case otcqx = "OTCQX"
    case oto = "OTO"
}

enum TypeEnum: String, Codable {
    case cs = "CS"
    case pfd = "PFD"
}
