//
//  ContentView.swift
//  Animations
//
//  Created by Micol on 25.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmuont = 1.0
    
    var body: some View {
        print(animationAmuont)
        
        return VStack {
            Stepper("Scale amount", value: $animationAmuont.animation(
                .easeInOut(duration: 1)
                .repeatCount(2, autoreverses: true)
            ), in: 1...10)
            
            Spacer()
            
            Button("Tap me") {
                animationAmuont += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmuont)
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
