//
//  CartModuleViewModel.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 14.12.2022.
//

import Foundation
import Combine

class CartModuleViewModel: ObservableObject {
    
    let network: DataFetcher
    @Published var model: MyCartResponse?
    var cancellable = Set<AnyCancellable>()
    
    init() {
        network = DataFetcher()
        fetchModel()
    }
    
    func fetchModel() {
        network.getMyCartData()
            .receive(on: RunLoop.main)
            .sink { _ in } receiveValue: { model in
                self.model = model
            }
            .store(in: &cancellable)
    }
}
