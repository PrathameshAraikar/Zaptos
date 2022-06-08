//
//  ShoeViewModelCombine.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 07/06/22.
//

import Foundation
import Combine

class ShoeViewModelCombine: ObservableObject {
    
    @Published var allAdidasShoes: [ShoeModel] = []
    @Published var allNikeShoes: [ShoeModel] = []
    @Published var allPumaShoes: [ShoeModel] = []
    
    var cancellables = Set<AnyCancellable>()

    init() {
        getAdidasData()
    }

    func getAdidasData() {
        guard let url = URL(string: "https://zaptos-server.herokuapp.com/adidas") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            //.subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: [ShoeModel].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .sink(receiveValue: { [weak self] (returnedShoes) in
                self?.allAdidasShoes = returnedShoes
            })
            .store(in: &cancellables)
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard
            let response = output.response as? HTTPURLResponse,
            response.statusCode >= 200 && response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
}

