//
//  SearchBarView.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 24/10/2023.
//

import SwiftUI

struct SearchBarView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search for amazing content", text: $searchText)
                .padding(.leading)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(8)
        .padding()
    }
}
#Preview {
    SearchBarView()
}
