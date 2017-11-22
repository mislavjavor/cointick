//
//  Config.swift
//  cointickPackageDescription
//
//  Created by jami on 21/11/2017.
//

import Foundation
import Cocoa

enum Currency: String, Codable {
    case eur = "EUR"
    case usd = "USD"
}

struct Ticker: Codable {
    
    let symbol: String
    let quanitityOwned: Int
    
}

struct ConfigModel: Codable {
    
    let currencyFormat: Currency
    let tickers: [Ticker]
    
}
