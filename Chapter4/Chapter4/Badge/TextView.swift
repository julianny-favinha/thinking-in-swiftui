//
//  TextView.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 22/04/21.
//

import Foundation
import SwiftUI

struct TextView: View {
    @State var colorHue: Double = 0

    var body: some View {
        VStack(spacing: 40) {
            Text("Hello")
                .padding(10)
                .background(Color.gray)
                .badge(count: 5, alignment: .bottomLeading)

            Text("Hello, World!")
                .padding(10)
                .background(Color.gray)
                .badge(count: 10)

            Text("Hello")
                .padding(10)
                .background(Color.gray)
                .badge(count: 0)

            HStack {
                Text("Color hue")
                Slider(value: $colorHue, in: 0...1)
            }
        }
        .badgeColor(Color(hue: colorHue, saturation: 1, brightness: 1))
        .padding()
    }
}
