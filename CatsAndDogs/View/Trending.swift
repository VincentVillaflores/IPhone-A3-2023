//
//  Trending.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 24/10/2023.
//

import SwiftUI

struct Trending: View {
    @ObservedObject var viewModel = API()
    
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
                
            }
    }
}

#Preview {
    Trending()
}
