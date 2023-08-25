//
//  ContentView.swift
//  Animations
//
//  Created by Micol on 25.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmuont = 0.0
    
    var body: some View {
        Button("Tap me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmuont += -360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmuont), axis: (x:0, y:0, z:1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
