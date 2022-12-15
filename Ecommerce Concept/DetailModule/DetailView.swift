//
//  DetailView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 04.12.2022.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: DetailModuleViewModel
    var images = [
        "https://avatars.mds.yandex.net/get-mpic/5235334/img_id5575010630545284324.png/orig",
        "https://www.manualspdf.ru/thumbs/products/l/1260237-samsung-galaxy-note-20-ultra.jpg"
      ]
    var buttons = ["Shop", "Details", "Features"]
    @State var qwe = 0
    @State var int = 0
    @State var memoryToggle = 0
    var body: some View {
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .tint(.white)
                }
                .frame(width: 37, height: 37)
                .background(Color("darkBlue"))
                .cornerRadius(10)
                Spacer()
                Text("Product Details")
                    .font(.system(size: 18))
                Spacer()
                Button {
                    
                } label: {
                    Image("Card")
                        .foregroundColor(.white)
                }
                .frame(width: 37, height: 37)
                .background(Color("orange"))
                .cornerRadius(10)
            }
            .padding(EdgeInsets(top: 0, leading: 42, bottom: 0, trailing: 35))
            ScrollView {
                VStack {
                    CarouselView(itemHeight: 300, views: viewModel.model?.images.map({ image in
                        return AnyView(AsyncImage(url: URL(string: image)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {})
                    }) ?? [])
                    .padding([.top, .bottom])
                    VStack {
                        HStack {
                            Text(viewModel.model?.title ?? "")
                                .font(.system(size: 24))
                            Spacer()
                            Button {
                                viewModel.model?.isFavorites.toggle()
                            } label: {
                                Image(systemName: viewModel.model?.isFavorites ?? false ? "heart.fill" : "heart")
                                    .tint(.white)
                            }
                            .frame(width: 37, height: 37)
                            .background(Color("darkBlue"))
                            .cornerRadius(10)
                        }
                        .padding([.leading, .trailing], 37)
                        .padding(.top, 28)
                        HStack {
                            ForEach(0..<5) { _ in
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("starColor"))
                            }
                            Spacer()
                        }
                        .padding(.leading, 35)
                        HStack(spacing: 50) {
                            ForEach(0..<buttons.count) { index in
                                VStack {
                                    Button {
                                        int = index
                                    } label: {
                                        Text(buttons[index])
                                            .font(.system(size: 20))
                                            .foregroundColor(.black)
                                            .fontWeight(index == int ? .bold : .regular)
                                    }
                                }
                            }
                        }
                        .padding(EdgeInsets(top: 32, leading: 27, bottom: 0, trailing: 27))
                        PickerView(selectedSegment: $int)
                            .padding([.leading, .trailing, .bottom], 35)
                        HStack(spacing: 36) {
                            VStack {
                                Image("CPU")
                                    .frame(width: 28, height: 28)
                                Text(viewModel.model?.CPU ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11))
                            }
                            VStack {
                                Image("Camera")
                                    .frame(width: 28, height: 28)
                                Text(viewModel.model?.camera ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11))
                            }
                            VStack {
                                Image("Memory")
                                    .frame(width: 28, height: 28)
                                Text(viewModel.model?.ssd ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11))
                            }
                            VStack {
                                Image("sd")
                                    .frame(width: 28, height: 28)
                                Text(viewModel.model?.sd ?? "")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 11))
                            }
                        }
                        HStack {
                            Text("Select color and capacity")
                                .padding(.leading, 37)
                            Spacer()
                        }
                        .padding(.top)
                        HStack {
                            ForEach(0..<(viewModel.model?.color.count ?? 2)) { i in
                                Button {
                                    qwe = i
                                } label: {
                                    Circle()
                                        .frame(width: 40, height: 40)
                                        .foregroundColor(Color(hex: viewModel.model?.color[i] ?? ""))
                                        .overlay {
                                            Image(systemName: i == qwe ? "checkmark" : "")
                                                .frame(width: 18.0, height: 30.0)
                                                .foregroundColor(.white)
                                        }
                                }
                            }
                            
                            Spacer()
                            ForEach(0..<(viewModel.model?.capacity.count ?? 2)) {i in
                                Button {
                                    memoryToggle = i
                                } label: {
                                    Text(viewModel.model?.capacity[i] ?? "")
                                        .foregroundColor(i == memoryToggle ? .white : .gray)
                                        .font(.system(size: 13))
                                }
                                .padding(10)
                                .background(i == memoryToggle ? Color("orange") : Color.white)
                                .cornerRadius(10)
                            }
                        }
                        .padding([.leading, .trailing], 37)
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Add to card")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                Spacer()
                                Text(String(describing: viewModel.model?.price ?? 0))
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                            }
                            .padding([.top, .bottom], 15)
                            .padding([.leading, .trailing], 40)
                        }
                        .background(Color("orange"))
                        .cornerRadius(10)
                        .padding(37)
                    }
                    .background(
                        Rectangle()
                            .foregroundColor(.white)
                            .cornerRadius(20)
                            .shadow(color: .gray, radius: 1, x: 0, y: -3)
                    )
                }
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(viewModel: DetailModuleViewModel())
    }
}
