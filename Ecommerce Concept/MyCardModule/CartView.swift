//
//  SwiftUIView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 14.12.2022.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: CartModuleViewModel
    var body: some View {
        VStack {
            HStack {
                Button {
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.white)
                }
                .frame(width: 37, height: 37)
                .background(Color("darkBlue"))
                .cornerRadius(10)
                Spacer()
                Text("Add adress")
                    .font(.system(size: 15))
                Button {
                } label: {
                    Image("Card")
                        .foregroundColor(.white)
                }
                .frame(width: 37, height: 37)
                .background(Color("orange"))
                .cornerRadius(10)
            }
            
            .padding([.trailing, .leading], 37)
            
            VStack {
                HStack {
                    Text("My Cart")
                        .font(.system(size: 35, weight: .bold))
                    Spacer()
                }
                .padding(.leading, 37)
                .padding(.top, 50)
                Spacer()
                VStack {
                    ScrollView {
                        ForEach(viewModel.model?.basket ?? []) { value in
                            CartPositionView(image: "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg")
                        }
                        .padding([.leading, .trailing])
                        .padding(.top, 80)
                    }
                    Spacer()
                    Color.gray.frame(height: 1 / UIScreen.main.scale)
                    HStack {
                        Text("Total")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                        Spacer()
                        Text(String(describing: viewModel.model?.total ?? 0))
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                    }
                    .padding([.leading, .trailing], 50)
                    .padding([.top], 12)
                    HStack {
                        Text("Delivery")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                        Spacer()
                        Text(viewModel.model?.delivery ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                    }
                    .padding([.leading, .trailing], 50)
                    .padding([.top, .bottom], 12)
                    Color.gray.frame(height: 1 / UIScreen.main.scale)
                    HStack {
                        Button {
                            
                        } label: {
                            Text("Checkout")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: MainScreenViewModel.screenWidth, height: 54)
                                .padding([.leading, .trailing], -44)
                                .background(Color("orange"))
                                .cornerRadius(10)
                        }
                    }
                    .padding(.bottom, 74)
                }
                .frame(width: MainScreenViewModel.screenWidth)
                .background(
                    RoundedRectangle(cornerRadius: 30)
                        .foregroundColor(Color("darkBlue"))
                )
            }
            .ignoresSafeArea()
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartModuleViewModel())
    }
}
