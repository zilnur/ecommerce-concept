//
//  MainScreenView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 02.12.2022.
//

import SwiftUI

struct MainScreenView: View {
    
    @State private var searchTextFieldText = ""
    @State private var isOpenFilter = false
    @State private var itemIndex = 1
    @ObservedObject var viewModel: MainScreenViewModel
    let columns = [GridItem(.flexible()),GridItem(.flexible())]
    private var buttonImages = ["Phones", "Computer", "Health", "Books", "Phones", "Computer", "Health", "Books"]
    
    init(viewModel: MainScreenViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack() {
                ZStack {
                    HStack {
                        Image("mapPointer")
                            .resizable()
                            .frame(width: 12, height: 15)
                        Text("Zihuatanejo, Gro")
                        Image("arrowDown")
                            .resizable()
                            .frame(width: 10, height: 5)
                    }
                    Button {
                        isOpenFilter.toggle()
                    } label: {
                        Image("filter")
                            .resizable()
                            .frame(width: 11, height: 13)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 35)
                    .sheet(isPresented: $isOpenFilter) {
                        FilterView()
                            .presentationDetents([.height(350)])
                    }
                }
            }
            ScrollView(.vertical) {
                HStack {
                    Text("Select Categoty")
                        .font(.system(size: 25))
                        .padding(.leading, 17)
                    Spacer()
                    Text("view all")
                        .font(.system(size: 15))
                        .foregroundColor(Color(red: 1, green: 0.429, blue: 0.304))
                        .padding(.trailing, 33)
                }
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<buttonImages.count) { index in
                            VStack {
                                Button {
                                    itemIndex = index
                                } label: {
                                    Circle()
                                        .frame(width: 71, height: 71)
                                        .foregroundColor(index == itemIndex ? Color("orange") : .white)
                                        .overlay {
                                            Image(buttonImages[index])
                                                .frame(width: 18.0, height: 30.0)
                                                .foregroundColor(index == itemIndex ? .white : .black)
                                        }
                                }
                                Text(buttonImages[index])
                                    .foregroundColor(Color("orange"))
                                    .font(.system(size: 12))
                            }
                        }
                    }
                    .padding(.leading, 27)
                }
                .scrollIndicators(.hidden)
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .frame(width: 16, height: 16)
                            .foregroundColor(Color("orange"))
                            .padding(.leading, 24)
                        TextField("Search", text: $searchTextFieldText)
                            .padding(.leading)
                    }
                    .frame(height: 34)
                    .background(Color.white)
                    .cornerRadius(17)
                    .padding(.leading, 32)
                    Circle()
                        .frame(width: 34, height: 34)
                        .foregroundColor(Color("orange"))
                        .overlay {
                            Image("categories")
                                .foregroundColor(.white)
                        }
                        .padding(EdgeInsets(top: 0, leading: 11, bottom: 0, trailing: 37))
                }
                .padding(.top, 35)
                HStack {
                    Text("Hot sales")
                        .font(.system(size: 25))
                        .padding(.leading, 17)
                    Spacer()
                    Text("see more")
                        .font(.system(size: 15))
                        .foregroundColor(Color(red: 1, green: 0.429, blue: 0.304))
                        .padding(.trailing, 33)
                }
                .padding(.top, 24)
                TabView {
                    ForEach(viewModel.homeStore) { model in
                        ZStack {
                            AsyncImage(url: URL(string: model.picture)) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .padding(.leading, 100)
                                    .frame(width: UIScreen.main.bounds.width - 36)
                            } placeholder: {}
                            Rectangle()
                                .foregroundColor(.clear)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [.black, .black, .black, .clear, .clear]), startPoint: .leading, endPoint: .trailing)
                                )
                            HStack {
                                VStack(alignment: .leading) {
                                    Spacer()
                                    if model.isNew ?? false {
                                        Text("New")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18))
                                            .padding(10)
                                            .background(Color("orange"))
                                            .mask(Circle())
                                    }
                                    Text(model.title )
                                        .font(.system(size: 30))
                                        .foregroundColor(.white)
                                    Text(model.subtitle )
                                        .foregroundColor(.white)
                                        .font(.system(size: 11))
                                    Button {
                                        
                                    } label: {
                                        Text("Buy now!")
                                            .foregroundColor(.black)
                                            .padding(EdgeInsets(top: 5,
                                                                leading: 27,
                                                                bottom: 5,
                                                                trailing: 27))
                                            .background(.white)
                                            .cornerRadius(5)
                                    }
                                    .padding(.bottom)
                                }
                                .frame(width: 200)
                                Spacer()
                            }
                        }
                        .frame(width: UIScreen.main.bounds.width - 36)
                        .cornerRadius(10)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .padding(.top, 10)
                .frame(height: MainScreenViewModel.screenWidth / 2)
                HStack {
                    Text("Best Seller")
                        .font(.system(size: 25))
                        .padding(.leading, 17)
                    Spacer()
                    Text("see more")
                        .font(.system(size: 15))
                        .foregroundColor(Color(red: 1, green: 0.429, blue: 0.304))
                        .padding(.trailing, 33)
                }
                .padding(.top, 24)
                LazyVGrid(columns: columns, spacing: 11) {
                    ForEach(viewModel.bestSeller) { model in
                        NavigationLink(destination: DetailView(viewModel: DetailModuleViewModel())) {
                            ProductCardView(image: model.picture,
                                            price: model.priceWithoutDiscount,
                                            discountPrice: model.discountPrice,
                                            phoneModel: model.title)
                        }
                        
                    }
                }
                .padding(EdgeInsets(top: 17,
                                    leading: 17,
                                    bottom: 100,
                                    trailing: 17))
            }
        }
        .ignoresSafeArea(.all, edges: .bottom)
        .refreshable {
            viewModel.fetchData()
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = MainScreenViewModel()
        MainScreenView(viewModel: viewModel)
            .background(Color(red: 0.961, green: 0.961, blue: 0.961))
    }
}
