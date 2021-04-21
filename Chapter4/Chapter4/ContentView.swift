//
//  ContentView.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 17/04/21.
//

import SwiftUI

struct Element {
    let size: CGFloat
    let color: Color
}

struct ColorfulSquare: View {
    let element: Element

    var body: some View {
        Rectangle()
            .fill(element.color)
            .frame(width: element.size, height: element.size)
    }
}

struct Collapsible<Element, Content: View>: View {
    var data: [Element]
    var expanded: Bool = false
    var alignment: VerticalAlignment
    var spacing: CGFloat
    var content: (Element) -> Content

    var body: some View {
        if expanded {
            HStack(alignment: alignment, spacing: spacing) {
                ForEach(0..<data.count) { index in
                    content(data[index])
                }
            }
        } else {
            ZStack {
                ForEach(0..<data.count) { index in
                    content(data[index])
                }
            }
        }
    }
}

struct ContentView: View {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
