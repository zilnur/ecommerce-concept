import Foundation
import UIKit
import Combine

enum SelectedItem: String, CaseIterable, Identifiable {
    case samsung
    case apple
    case xiaomi
    var id: Self {
        self
    }
    var title: String {
        self.rawValue
    }
}

class MainScreenViewModel: ObservableObject {
    
    let network: DataFetcher
    var cancellable =  Set<AnyCancellable>()
    static let screenWidth = UIScreen.main.bounds.width
    @Published var isFilter = false
    @Published var modelSelection: [String] = ["Samsung", "Iphone", "Xiaomi"]
    @Published var homeStore: [HomeStore] = []
    @Published var bestSeller: [BestSeller] = []
    
    init() {
        self.network = DataFetcher()
        fetchData()
    }
    
    func fetchData() {
        network.getMainScreenData()
            .receive(on: RunLoop.main)
            .sink { _ in} receiveValue: { model in
                self.homeStore = model.homeStore
                self.bestSeller = model.bestSeller
            }
            .store(in: &cancellable)
    }
}
