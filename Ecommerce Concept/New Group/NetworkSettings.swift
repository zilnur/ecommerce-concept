import Foundation
import Combine

protocol Coordinatable {
    
}

class NetworkSettings {
    
    private func url(path: String) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "run.mocky.io"
        components.path = path
        components.queryItems = []
        return components.url!
    }
    
    private func decoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
    
    func dataTaskPublisher<T: Codable>(path: String, model: T.Type) -> AnyPublisher<T,Error> {
        return URLSession.shared.dataTaskPublisher(for: url(path: path))
            .tryMap{ response in
                guard let httpURLResponse = response.response as? HTTPURLResponse,
                     httpURLResponse.statusCode == 200
                     else {
                       throw MyError.error
                   }
                   return response.data
                 }
            .decode(type: model.self, decoder: decoder())
            .eraseToAnyPublisher()
    }
}
