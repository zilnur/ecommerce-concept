//
//  MenuView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 03.12.2022.
//

import SwiftUI

struct MenuView: View {
    private var title: String
    @State private var menuTitle: String
    private var brandTitles: [String]
    
    init(title: String, menuTitle: String, brandTitles: [String]) {
        self.title = title
        self.brandTitles = brandTitles
        self.menuTitle = menuTitle
    }
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 18))
            Menu {
                ForEach(0..<brandTitles.count) { index in
                    Button {
                        menuTitle = brandTitles[index]
                    } label: {
                        Text(brandTitles[index])
                    }
                }
            } label: {
                HStack {
                    Text(menuTitle)
                        .padding(.leading, 14)
                    Spacer()
                    Image(systemName: "chevron.down")
                        .padding(.trailing, 20)
                }
            }
            .frame(height: 37)
            .foregroundColor(.black)
            .overlay {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(.gray, lineWidth: 1)
            }
            .padding(.trailing, 31)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(title: "string", menuTitle: "string", brandTitles: ["string"])
    }
}
