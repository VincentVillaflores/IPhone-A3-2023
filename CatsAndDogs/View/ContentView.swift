//
//  ContentView.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 24/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Text("Cats & Dogs")
            .animation(.bouncy(duration: 10), value: animationAmount)
            .onAppear{
                animationAmount += 1
            }
    }
}

#Preview {
    ContentView()
}
