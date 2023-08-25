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
        Button("Tap me"){
            //jumpy animation, in clear steps
            animationAmuont += 1
        }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmuont)
            .blur(radius: (animationAmuont - 1 ) * 3)
        //smooth animation
            .animation(.default, value: animationAmuont)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
