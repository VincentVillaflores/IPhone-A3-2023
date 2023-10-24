//
//  Home.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 24/10/2023.
//

import SwiftUI

struct Home: View {
    @State private var selectedTab: Tab = .trending
    
    enum Tab {
        case trending, following
    }
    
    var body: some View {
        VStack {
            SearchBarView()
            HStack {
                Text("Trending")
                    .padding()
                    .background(selectedTab == .trending ? Color.gray.opacity(0.3) : Color.clear)
                    .onTapGesture { selectedTab = .trending }
                
                Text("Following")
                    .padding()
                    .background(selectedTab == .following ? Color.gray.opacity(0.3) : Color.clear)
                    .onTapGesture { selectedTab = .following }
            }
            if selectedTab == .trending {
                Trending()
            } else if selectedTab == .following {
                Following()
            }
            
            Spacer()
        }
    }
}

#Preview {
    Home()
}
