//
//  Trending.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 24/10/2023.
//

import SwiftUI

struct Trending: View {
    @ObservedObject var viewModel = API()
    private var userStorage = UserStorage()
    
    var body: some View {
        switch viewModel.state {
        case .idle:
            ProgressView().onAppear {viewModel.fetchRandomImage()}
        case .loading:
            ProgressView()
        case .failed(let error):
            VStack {
                Text("\(error.localizedDescription)")
                Text("Please try again later.")
            }
            
        case .loaded(let searchResults):
            List {
                if !searchResults.isEmpty {
                    // Define the grid layout
                    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(searchResults, id: \.id) { searchResult in
                            AsyncImage(url: URL(string:"https://picsum.photos/id/\(searchResult.id)/200/300")) { phase in
                                switch phase {
                                case .success(let image):
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipped()
                                        .onTapGesture {
                                            userStorage.write(id: Int(searchResult.id)!)
                                        }
                                case .failure(_), .empty:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 300) // Set frame for placeholder
                                        .clipped()
                                @unknown default:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .foregroundColor(.gray)
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 200, height: 300) // Set frame for placeholder
                                        .clipped()
                                }
                            }
                            .padding(1) // Adjust as needed
                        }
                    }
                    
                    
                } else {
                    Text("No matching items")
                }
            }
            
        }
    }
}

#Preview {
    Trending()
}
