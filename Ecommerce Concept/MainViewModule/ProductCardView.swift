//
//  ProductCardView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 04.12.2022.
//

import SwiftUI

struct ProductCardView: View {
    private var image: String
    private var price: Int
    private var discountPrice: Int
    private var phoneModel: String
    @State private var isLiked = false
    init(image: String, price: Int, discountPrice: Int, phoneModel: String) {
        self.image = image
        self.price = price
        self.discountPrice = discountPrice
        self.phoneModel = phoneModel
    }
    
    var body: some View {
            VStack {
                ZStack {
                    AsyncImage(url: URL(string: image)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        Text("downloading..")
                    }
                    HStack {
                        Spacer()
                        VStack {
                            Button {
                                isLiked.toggle()
                            } label: {
                                Circle()
                                    .foregroundColor(.white)
                                    .frame(width: 25, height: 25)
                                    .padding(EdgeInsets(top: 11,
                                                        leading: 0,
                                                        bottom: 0,
                                                        trailing: 15))
                                    .overlay {
                                        Image(systemName: isLiked ? "heart.fill" : "heart")
                                            .padding(EdgeInsets(top: 12,
                                                                leading: 0,
                                                                bottom: 0,
                                                                trailing: 14))
                                            .foregroundColor(Color("orange"))
                                            .frame(width: 11, height: 10)
                                    }
                            }
                            Spacer()
                        }
                    }
                }
                HStack(alignment: .lastTextBaseline) {
                    Text("$\(price)")
                        .padding(.leading, 21)
                        .font(.system(size: 16))
                    Text("$\(discountPrice)")
                        .strikethrough()
                        .font(.system(size: 10))
                        .foregroundColor(.gray)
                    Spacer()
                }
                HStack {
                    Text(phoneModel)
                        .padding(.leading, 21)
                        .font(.system(size: 10))
                    Spacer()
                }
            }
            .background(Color.white)
            .cornerRadius(10)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(image: "image",
                        price: 1047,
                        discountPrice: 1500,
                        phoneModel: "Samsung")
    }
}
