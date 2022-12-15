import Foundation
import Combine

class DetailModuleViewModel: ObservableObject {
    
    let network: DataFetcher
    @Published var model: ProducDetailResponse?
    var cancellable =  Set<AnyCancellable>()
    
    init() {
        self.network = DataFetcher()
        fetchData()
    }
    
    func fetchData() {
        network.DetailScreenData()
            .receive(on: RunLoop.main)
            .sink { _ in} receiveValue: { model in
                self.model = model
                self.model?.images.append(contentsOf: model.images)
            }
            .store(in: &cancellable)
    }
}
