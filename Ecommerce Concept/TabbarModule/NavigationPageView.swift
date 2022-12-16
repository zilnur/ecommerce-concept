import SwiftUI
import Combine

struct NavigationPageView: View {
    @ObservedObject var cartViewModel = CartModuleViewModel()
    var body: some View {
        NavigationView {
            TabBarView(pages: .constant([TabBarPage(page: MainScreenView(viewModel: MainScreenViewModel()),
                                                    icon: "person",
                                                    label: .explorer,
                                                    tag: 0,
                                                    color: .white,
                                                    badge: 0),
                                         TabBarPage(page: CartView(viewModel: cartViewModel),
                                                    icon: "book",
                                                    label: .bag,
                                                    tag: 1,
                                                    color: .blue, badge: cartViewModel.model?.basket.count ?? 0),
                                         TabBarPage(page: Text("Отстутствует UI"),icon: "heart", label: .other("heart"), tag: 2, color: .blue, badge: 0)]))
        }
        .tint(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationPageView()
    }
}
