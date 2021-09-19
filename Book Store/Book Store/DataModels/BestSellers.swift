//
//  BestSellers.swift
//  Book Store
//
//  Created by Jorge Martinez on 05/09/21.
//

import Foundation

struct BestSellers: Decodable {
    
    var results: ResultsBestSellers
}

struct ResultsBestSellers: Decodable {
    
    var best_sellers: [String]
}
