import Foundation

struct ProducDetailResponse: Codable, Identifiable {
    let CPU: String
    let camera: String
    let capacity: [String]
    let color: [String]
    let id : String
    var images: [String]
    var isFavorites: Bool
    let price: Int
    let rating: Double
    let sd: String
    let ssd: String
    let title: String
}
