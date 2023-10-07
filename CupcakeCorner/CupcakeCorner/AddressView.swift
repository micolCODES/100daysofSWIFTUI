//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Micol on 07.10.23.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        Text("Address View")
    }
}

#Preview {
    AddressView(order: Order())
}
