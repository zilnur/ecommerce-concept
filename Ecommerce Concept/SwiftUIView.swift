//
//  SwiftUIView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 03.12.2022.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var selection = 0
    @State private var textfieldValue = ""
    @State private var textfieldValue2 = ""
    @State private var ispickershowing = false

    var values = ["V1", "V2", "V3"]

    var body: some View {

        VStack {

            TextField("Pick one from the picker:", text: $textfieldValue, onEditingChanged: {
                edit in

                if edit {
                    self.ispickershowing = true
                } else {
                    self.ispickershowing = false
                }
            })

            if ispickershowing {

                Picker(selection: $selection, label:
                    Text("Pick one:")
                    , content: {
                        ForEach(0 ..< values.count) { index in
                            Text(self.values[index])
                                .tag(index)
                        }
                })

                Text("you have picked \(self.values[self.selection])")

                Button(action: {
                    self.textfieldValue = self.values[self.selection]
                }, label: {
                    Text("Done")
                })
            }

            TextField("simple textField", text: $textfieldValue2)
        }
      }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
