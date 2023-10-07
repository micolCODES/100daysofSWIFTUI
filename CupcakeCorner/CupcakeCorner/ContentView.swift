//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Micol on 07.10.23.
//

import SwiftUI

class User: ObservableObject, Codable {
    
    //make @Published variable Codable:
    //Step 1: make Enum called "CodingKeys" and list every var you want to make Codable
    enum CodingKeys: CodingKey {
        case name
    }
    
    @Published var name = "Micol"
    
    //Step 2: make custom initializer to allow "Decoding"
        //required: anyone who subclasses the user class must override the initialized with custom date with they own values. Alternatively, you can mark the class with the final keyword
    required init(from decoder: Decoder) throws {
        //make a container that will have the keys from CodingKeys enum that will allow me to "custom decode" my data
        let container = try decoder.container(keyedBy: CodingKeys.self)
        // stick a string into a name variable that conforms to the .name key that matches our enum case
        name = try container.decode(String.self, forKey: .name)
    }
    //Step 3: redo the same, but to encode it
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //TRY because it might fail!
        try container.encode(name, forKey: .name)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
