//
//  ShowCommand.swift
//  cointickPackageDescription
//
//  Created by jami on 22/11/2017.
//

import Foundation
import Rainbow
import SwiftCLI

class ShowCommand: Command {
    var name: String = "show"
    var shortDescription: String = "Show the tickers for selected crytocurrencies"
    
    func execute() throws {
        
        CoinService.getTicker(onComplete: { result in
            switch result {
            case .success(let coins):
                prettyPrint(coins)
                exit(0)
            case .error(let message):
                print(message)
            }
        })
        
    }
}
