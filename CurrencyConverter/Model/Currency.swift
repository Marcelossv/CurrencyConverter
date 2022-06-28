//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Marcelo Silva on 27/06/22.
//

import Foundation

// MARK: - Currency
struct Currency: Codable {
    let motd: MOTD
    let success: Bool
    let query: Query
    let info: Info
    let historical: Bool
    let date: String
    let result: Double
}

// MARK: - Info
struct Info: Codable {
    let rate: Double
}

// MARK: - MOTD
struct MOTD: Codable {
    let msg: String
    let url: String
}

// MARK: - Query
struct Query: Codable {
    let from, to: String
    let amount: Int
}
