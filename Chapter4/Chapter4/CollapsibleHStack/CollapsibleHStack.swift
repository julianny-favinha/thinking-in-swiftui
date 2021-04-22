//
//  CollapsibleHStack.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 22/04/21.
//

import Foundation
import SwiftUI

struct CollapsibleHStack: View {
    @State private var expanded: Bool = true
    @State private var align: Int = 0
    @State private var spacing: CGFloat = 8

    private var alignment: VerticalAlignment {
        switch align {
        case 0:
            return .center
        case 1:
            return .top
        case 2:
            return .bottom
        default:
            return .center
        }
    }

    var body: some View {
        VStack {
            Collapsible(
                data: [
                    Element(size: 70, color: .purple),
                    Element(size: 40, color: .green),
                    Element(size: 90, color: .blue)
                ],
                expanded: expanded,
                alignment: alignment,
                spacing: spacing
            ) { element -> ColorfulSquare in
                ColorfulSquare(element: element)
            }
            .border(Color.black)

            Toggle("Is expanded", isOn: $expanded)


            HStack {
                Text("Vert alignment")

                Picker(selection: $align, label: Text("Vertical alignment")) {
                    Text("Center").tag(0)
                    Text("Top").tag(1)
                    Text("Bottom").tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            HStack {
                Text("Spacing")

                Slider(value: $spacing, in: 0...40)
            }
        }
        .padding()
    }
}
