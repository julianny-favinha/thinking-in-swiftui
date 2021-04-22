//
//  Collapsible.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 21/04/21.
//

import Foundation
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
            ZStack() {
                ForEach(0..<data.count - 1) { index in
                    content(data[index])
                }

                content(data[data.count - 1])
                    .alignmentGuide(.center, computeValue: { dim in
                        return dim[.center] - 40
                    })
            }
        }
    }
}
