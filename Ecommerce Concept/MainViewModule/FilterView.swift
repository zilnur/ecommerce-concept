//
//  FilterView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 03.12.2022.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .tint(.white)
                }
                .frame(width: 37, height: 37)
                .background(Color("darkBlue"))
                .cornerRadius(10)
                .padding(.leading, 44)
                Spacer()
                Text("Filter options")
                    .font(.system(size: 18))
                Spacer()
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Done")
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
                .frame(width: 86, height: 37)
                .background(Color("orange"))
                .cornerRadius(10)
                .padding(.trailing, 20)
            }
            .padding(.top, 24)
            VStack(alignment: .leading) {
                MenuView(title: "Brands",
                         menuTitle: "Samsung",
                         brandTitles: ["Samsung", "Apple", "Xiaomi"])
                MenuView(title: "Price",
                         menuTitle: "$0 - $300",
                         brandTitles: ["$0 - $300", "$300 - $500"])
                MenuView(title: "Size", menuTitle: "0", brandTitles: [])
            }
            .padding(.leading, 46)
            .padding(.bottom, 24)
        }
        .frame(width: MainScreenViewModel.screenWidth)
        .background(.white)
        .cornerRadius(30)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
