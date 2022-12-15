import SwiftUI

struct TabBarView: View {
    
    @State var selectedTab = 0
    @Binding var pages: [TabBarPage]
    init(pages: Binding<[TabBarPage]>) {
        UITabBar.appearance().isHidden = true
        self._pages = pages
    }
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection: $selectedTab) {
                
                ForEach(pages) { item in
                    AnyView(_fromValue: item.page)
                        .tabItem{
                            EmptyView()
                        }
                        .tag(item.tag)
                }
            }
            
            HStack {
                ForEach(pages) { item in
                    Button(action: {
                        self.selectedTab = item.tag
                    }) {
                        ZStack {
                            TabViewLabels(_case: item.label, badges: item.badge)
                                .padding(7)
                                .padding([.top, .bottom], 10)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .padding(5)
            .background(Color("darkBlue"))
            .cornerRadius(30)
        }
        .ignoresSafeArea(.all, edges: .bottom)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(pages: .constant([TabBarPage(page: MainScreenView(viewModel: MainScreenViewModel()),
                                                icon: "person",
                                                label: .explorer,
                                                tag: 0,
                                                color: .white,
                                                badge: 0),
                                     TabBarPage(page: CartView(viewModel: CartModuleViewModel()),
                                                icon: "book",
                                                label: .bag,
                                                tag: 1,
                                                color: .white,
                                                badge: CartModuleViewModel().model?.basket.count ?? 0)]))
    }
}

struct TabBarPage: Identifiable {
    var id = UUID()
    var page: Any
    var icon: String
    var label: TabViewLabels.Label
    var tag: Int
    var color: Color
    @State var badge: Int
}

