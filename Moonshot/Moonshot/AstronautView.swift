//
//  AstronautView.swift
//  Moonshot
//
//  Created by Micol on 18.09.23.
//

import SwiftUI

struct AstronautView: View {
    
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    
    static var previews: some View {
        AstronautView(astronaut: astronauts["armstrong"]!)
        // "!" is a forced unwrap: it will run the option and if it's not, then it can crash. Only use when you are 100% sure it will be safe
    }
}
