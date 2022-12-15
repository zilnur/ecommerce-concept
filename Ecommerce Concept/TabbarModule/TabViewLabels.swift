//
//  TabViewLabels.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 15.12.2022.
//

import SwiftUI

struct TabViewLabels: View {
    
    enum Label {
        case explorer
        case bag
        case other(_ image: String)
    }
    
    @State var _case: Label
    @State var badges: Int
    
    var body: some View {
        switch _case {
        case .explorer:
            HStack {
                Circle()
                    .foregroundColor(.white)
                    .frame(width: 8, height: 8)
                Text("Explorer")
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .bold))
            }
        case .bag:
            ZStack {
                Image("bag")
                    .scaledToFill()
                    .frame(width: 10,height: 10)
                if badges > 0 {
                    Text(String(describing: badges))
                        .font(.system(size: 8))
                        .foregroundColor(.white)
                        .padding(4)
                        .background(.red)
                        .mask(Circle())
                        .padding(.leading)
                        .padding(.bottom)
                }
            }
        case .other(let image):
            Image(systemName: image)
                .tint(.white)
        }
    }
}

struct TabViewLabels_Previews: PreviewProvider {
    static var previews: some View {
        TabViewLabels(_case: .explorer, badges: 3)
    }
}
