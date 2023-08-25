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
            //must always be here, otherwise animation will activate on ANY change, even change in phone orientation
            animationAmuont += 1
        }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmuont)
                    .opacity(2 - animationAmuont)
                    .animation(
                        .easeInOut(duration: 13)
                        .repeatCount(3, autoreverses: false),
                        value: animationAmuont)
            )
            .onAppear{
                animationAmuont = 2
            }
            //.scaleEffect(animationAmuont)
            //.blur(radius: (animationAmuont - 1 ) * 3)
        //smooth animation
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
