//
//  ContentView.swift
//  Moonshot
//
//  Created by Micol on 11.09.23.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    let mission: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        VStack {
            //checking that it's load correctly by getting a count of the astronauts loaded
            Text("\(astronauts.count)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
