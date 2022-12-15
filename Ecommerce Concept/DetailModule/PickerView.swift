//
//  PickerView.swift
//  Ecommerce Concept
//
//  Created by Ильнур Закиров on 04.12.2022.
//

import SwiftUI

struct PickerView: View {
    
    @Binding var selectedSegment: Int
    
    init(selectedSegment: Binding<Int>) {
        self._selectedSegment = selectedSegment
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(named: "orange")
        UISegmentedControl.appearance().backgroundColor = UIColor(named: "white")
    }
    var body: some View {
        Picker("Color", selection: $selectedSegment) {
            Text("").tag(0)
            Text("").tag(1)
            Text("").tag(2)
        }
        .frame(height: 10)
        .cornerRadius(5)
        .pickerStyle(.segmented)
    }
}

struct PickerView_Previews: PreviewProvider {
    @State static var int = 1
    static var previews: some View {
        PickerView(selectedSegment: $int)
    }
}
