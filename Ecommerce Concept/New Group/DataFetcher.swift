import Foundation
import Combine

enum MyError: Error {
    case error
}

class DataFetcher {
    
    enum Paths: String {
        case main = "/v3/654bd15e-b121-49ba-a588-960956b15175"
        case detail = "/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5"
        case myCart = "/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149"

    }
    
    let network = NetworkSettings()
    
    func getMainScreenData() -> AnyPublisher<MainScreenResponse, Error> {
        network.dataTaskPublisher(path: Paths.main.rawValue, model: MainScreenResponse.self)
    }
    
    func DetailScreenData() -> AnyPublisher<ProducDetailResponse, Error> {
        network.dataTaskPublisher(path: Paths.detail.rawValue, model: ProducDetailResponse.self)
    }
    
    func getMyCartData() -> AnyPublisher<MyCartResponse, Error> {
        network.dataTaskPublisher(path: Paths.myCart.rawValue, model: MyCartResponse.self)
    }
}
