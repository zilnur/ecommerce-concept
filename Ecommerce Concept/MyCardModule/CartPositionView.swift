//
//  CartPositionView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 14.12.2022.
//

import SwiftUI

struct CartPositionView: View {
    var image: String
    @State var numberOfPositions = 2
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .frame(width: 90, height: 120)
                    .cornerRadius(20)
            } placeholder: {}
            VStack(alignment: .leading) {
                Text("Samsung Note 20 Ultra")
                    .font(.system(size: 20,weight: .medium))
                    .foregroundColor(.white)
                    .fixedSize(horizontal: false, vertical: true)
                Text("3000")
                    .padding(.top, 2)
                    .font(.system(size: 20,weight: .medium))
                    .foregroundColor(Color("orange"))
            }
            VStack(spacing: 10) {
                Button {
                    numberOfPositions -= 1
                } label: {
                     Image(systemName: "minus")
                        .padding(.top)
                        .tint(.white)
                }
                Text(String(describing: numberOfPositions))
                    .foregroundColor(.white)
                    .font(.system(size: 20,weight: .medium))
                    .padding([.leading,.trailing], 10)
                Button {
                    numberOfPositions += 1
                } label: {
                    Image(systemName: "plus")
                        .tint(.white)
                        .padding(.bottom)
                }
            }
            .background(Color("gray"))
            .cornerRadius(16)
            .padding(.leading, 33)
            Image("basket")
                .padding(.leading, 17)
        }
    }
}

struct CartPositionView_Previews: PreviewProvider {
    static var previews: some View {
        CartPositionView(image: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg")
    }
}
