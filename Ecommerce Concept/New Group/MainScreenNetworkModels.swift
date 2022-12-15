import Foundation

struct MainScreenResponse: Codable {
    let homeStore: [HomeStore]
    let bestSeller: [BestSeller]
}

struct HomeStore: Codable, Identifiable {
    let id: Int
    let isNew: Bool?
    let title: String
    let subtitle: String
    let picture: String
    let isBuy: Bool
}

struct BestSeller: Codable, Identifiable {
    let id: Int
    let isFavorites: Bool
    let title: String
    let priceWithoutDiscount: Int
    let discountPrice: Int
    let picture: String
}
