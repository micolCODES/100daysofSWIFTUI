//
//  ContentView.swift
//  Animations
//
//  Created by Micol on 25.08.23.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    //@State private var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation{                isShowingRed.toggle()
                }
                }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
