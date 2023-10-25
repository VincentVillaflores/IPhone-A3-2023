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
        VStack{
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for amazing content", text: $searchText)
                    .padding(.leading)
            }
            if (!searchText.isEmpty){
                Spacer()
                AsyncImage(url: URL(string:"https://picsum.photos/id/\(searchText)/200/300"))
            }
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
