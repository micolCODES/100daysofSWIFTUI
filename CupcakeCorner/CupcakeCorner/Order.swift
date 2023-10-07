//
//  Order.swift
//  CupcakeCorner
//
//  Created by Micol on 07.10.23.
//

import SwiftUI

class Order: ObservableObject {
    static let stypes = ["Vanilla", "Strawberry", "Chocholate", "Rainbow"]
    
    @Published var type = 0
    @Published var quantity = 3
    
    @Published var specialRequestEnabled = false
    @Published var extraFrosting = false
    @Published var addSprinkles = false
}
