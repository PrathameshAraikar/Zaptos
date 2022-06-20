//
//  PaymentViewModel.swift
//  Zaptos
//
//  Created by Prathamesh Araikar on 21/06/22.
//

import Foundation
import Combine
import Firebase
import FirebaseFirestore

class PaymentViewModel: ObservableObject {
    
    @Published var paymentLink: PaymentModel = PaymentModel(url: "")
    let currentUser = Auth.auth().currentUser?.uid ?? ""
    
    
    var cancellables = Set<AnyCancellable>()

    init() {
        getPaymentLink()
    }

    func getPaymentLink() {
        guard let url = URL(string: "https://zaptos-paymenturl.herokuapp.com/getPaymentLink/\(currentUser)") else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: DispatchQueue.main)
            .tryMap(handleOutput)
            .decode(type: PaymentModel.self, decoder: JSONDecoder())
            .replaceError(with: PaymentModel(url: "No URL found"))
            .sink(receiveValue: { [weak self] (returnedUrl) in
                self?.paymentLink = returnedUrl
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


