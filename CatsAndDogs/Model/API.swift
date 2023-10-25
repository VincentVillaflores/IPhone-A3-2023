//
//  API.swift
//  CatsAndDogs
//
//  Created by Vincent Villaflores on 24/10/2023.
//

import Foundation
import Combine

struct ImageSearch: Decodable{
    var id: String
    var url: String
}
class API: ObservableObject {
    
    /// Represents the possible states during a data fetch operation.
    enum State {
        case idle
        case loading
        case failed(Error)
        case loaded([ImageSearch])
    }
    
    @Published var state: State = .idle
    private let baseURL = "https://picsum.photos/v2/list?page="
    private let limit = "&limit=9"
    
    // represents the subscription to a service
    private var cancellables = Set<AnyCancellable>()
    
    func fetchRandomImage() {
        state = .loading
        let randomNumber: Int = Int.random(in: 1...100)
        
        let url = URL(string: "\(baseURL)\(randomNumber)\(limit)")!
        
        print(url)
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [ImageSearch].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.state = .failed(error)
                }
            }, receiveValue: { data in
                self.state = .loaded(data)
            })
            .store(in: &cancellables)
    }
}

