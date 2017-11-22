//
//  Utils.swift
//  cointickPackageDescription
//
//  Created by jami on 21/11/2017.
//

import Foundation
import Cocoa

@available(OSX 10.12, *)
func accessConfigFile() throws -> URL {
    let home = FileManager.default.homeDirectoryForCurrentUser
    let file = home.appendingPathComponent(".cointick")
    
    if !FileManager.default.fileExists(atPath: file.path) {
        try createInitialFile(url: file)
    }
    
    return file
}

func createInitialFile(url: URL) throws {
    
    let initialConfig = try JSONEncoder().encode(
        ConfigModel(currencyFormat: .usd, tickers: [])
    )
    
    try initialConfig.write(to: url)
}

func prettyPrint(_ coins: [CoinModel]) {
//    let columns = [
//        "Rank",
//        "Name",
//        "Price (USD)",
//        "Market Cap (USD)",
//        "Percent Change 7d",
//        "Percent Change 24h"
//    ].map { TextTableColumn(header: $0) }
//    
//    var table = TextTable(columns: columns)
//    
//    coins.forEach {
//        
//        table.addRow(values: [$0.rank,
//                              $0.name,
//                              $0.priceUSD,
//                              $0.marketCapUSD,
//                              $0.percentChange7d + "%",
//                              $0.percentChange24h + "%"])
//    }
//    
//    print(table.render())
    
    let data = [
        ["NAME", "PRICE", "MARKET CAP (USD)", "PERCENT CHANGE 24H", "PERCENT CHANGE 7D" ]
    ] + coins.map { [$0.name,
                    $0.priceUSD,
                    $0.marketCapUSD,
                    $0.percentChange24h + "%",
                    $0.percentChange7d + "%"] }
    
    let table = try? Table(data: data).table()
    
    print(table!)
}
