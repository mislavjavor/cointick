//
//  CoinService.swift
//  cointickPackageDescription
//
//  Created by jami on 21/11/2017.
//

import Foundation
import Alamofire

enum Result<T> {
    case success(T)
    case error(String)
}

struct CoinService {
    
    enum NetworkError: Error {
        case failedFetch
    }
    
    static let baseURL = "https://api.coinmarketcap.com/v1"
    
    typealias TickerFetchHandler = (Result<[CoinModel]>) -> Void
    
    static func getTicker(for currency: String = "",
                          onComplete: @escaping TickerFetchHandler) {
        
        let path = "/ticker" + currency
        
        Alamofire.request(baseURL + path).responseData { response in
            if let error = response.error {
                onComplete(.error(error.localizedDescription))
            }
            guard
                let data = response.data,
                let coin = try? CoinModel.create(from: data)
            else {
                onComplete(.error("No payload data or failed parsing"))
                return
            }
            onComplete(.success(coin))
        }
        
    }
    
}
