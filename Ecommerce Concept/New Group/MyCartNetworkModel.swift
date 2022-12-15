import Foundation

struct MyCartResponse: Codable {
    let basket: [Basket]
    let delivery: String
    let id: String
    let total: Int
}

struct Basket: Codable, Identifiable {
    let id: Int
    let images: String
    let price: Int
    let title: String
}
