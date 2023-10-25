//
//  Launch.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 25/10/2023.
//

import SwiftUI

struct Launch: View {
    @State private var opacity: Double = 0.0
    
    var body: some View {
        Text("Cats & Dogs")
            .font(.largeTitle)
            .opacity(opacity)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 5).repeatCount(2, autoreverses: true)) {
                    opacity = 1.0
                }
            }
    }
}

#Preview {
    Launch()
}
