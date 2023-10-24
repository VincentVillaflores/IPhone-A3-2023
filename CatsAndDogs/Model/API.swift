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
    private let baseURL = "https://picsum.photos/id/"
    private let info = "/info"
    
    // represents the subscription to a service
    private var cancellables = Set<AnyCancellable>()
    
    func fetchRandomImage() -> Int{
        state = .loading
        let randomNumber: Int = Int.random(in: 1...1000)
        
        let url = URL(string: "\(baseURL)\(randomNumber)\(info)")!
        
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
        
        return randomNumber
    }
    
    
    func fetchAnImage(id: Int) {
        state = .loading
        
        let url = URL(string: "\(baseURL)\(id)\(info)")!
        
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

