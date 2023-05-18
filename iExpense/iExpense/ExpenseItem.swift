//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Andrew Gilliland on 5/10/23.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
