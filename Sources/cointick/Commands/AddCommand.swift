//
//  AddCommand.swift
//  cointickPackageDescription
//
//  Created by jami on 21/11/2017.
//

import Foundation
import Rainbow
import SwiftCLI
import Cocoa

@available(OSX 10.12, *)
class AddCommand: Command {
    
    var name: String = "add"
    var shortDescription: String = "Add new cryptocurrency to track"
    
    let coinName = Parameter()
    
    func execute() throws {
        let fileHandle = try FileHandle(forUpdating: accessConfigFile())
        
        
        let configFile = try JSONDecoder()
                                .decode(ConfigModel.self,
                                        from: fileHandle.readDataToEndOfFile())
        
        if configFile.tickers.contains(coinName.value) {
            print("Coin ticker for \(coinName.value) has already been added"
                    .red.bold)
            return
        }
        
        let encoded = try JSONEncoder().encode(
            ConfigModel(currencyFormat: configFile.currencyFormat,
                   tickers: configFile.tickers + [coinName.value])
        )
        
        try encoded.write(to: accessConfigFile())
        exit(0)
    }
}










