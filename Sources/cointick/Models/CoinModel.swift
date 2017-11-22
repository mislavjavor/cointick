//
//  CoinModel.swift
//  cointickPackageDescription
//
//  Created by jami on 21/11/2017.
//

import Foundation
import Rainbow

struct CoinModel: Codable {
    let id: String
    let name: String
    let symbol: String
    let rank: String
    let priceUSD: String
    let priceBTC: String
    let volumeUSD24h: String
    let marketCapUSD: String
    let availableSupply: String
    let totalSupply: String
    let percentChange24h: String
    let percentChange7d: String
    let lastUpdated: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case symbol = "symbol"
        case rank = "rank"
        case priceUSD = "price_usd"
        case priceBTC = "price_btc"
        case volumeUSD24h = "24h_volume_usd"
        case marketCapUSD = "market_cap_usd"
        case availableSupply = "available_supply"
        case totalSupply = "total_supply"
        case percentChange24h = "percent_change_24h"
        case percentChange7d = "percent_change_7d"
        case lastUpdated = "last_updated"
    }
}

extension CoinModel {
    
    enum ModelParseError: Error {
        case failedMultiModelParse
    }
    
    static func create(from JSON: Data) throws -> [CoinModel] {
        let decoder = JSONDecoder()
        do {
            let models = try decoder.decode([CoinModel].self, from: JSON)
            return models
        } catch DecodingError.dataCorrupted(let err) {
            print(err.codingPath.map { $0.stringValue }.joined().red.bold)
            exit(1)
        } catch let error {
            print(error.localizedDescription.red.bold)
        }
        return []
    }
    
}
