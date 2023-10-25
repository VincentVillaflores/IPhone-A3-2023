//
//  ContentView.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 24/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showLaunchAnimation: Bool = true

    var body: some View {
        if showLaunchAnimation {
            Launch()
                .onAppear(perform: {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        withAnimation {
                            showLaunchAnimation = false
                        }
                    }
                })
        } else {
            Home()
        }
    }
}


#Preview {
    ContentView()
}
