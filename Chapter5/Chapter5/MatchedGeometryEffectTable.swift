//
//  MatchedGeometryEffectTable.swift
//  Chapter5
//
//  Created by Julianny Favinha Donda on 04/05/21.
//

import Foundation
import SwiftUI

struct WidthPreference: PreferenceKey {
    static var defaultValue: CGFloat?

    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let v = value, let next = nextValue() else { return }
        value = max(v, next)
    }
}

extension View {
    func widthPreference() -> some View {
        self.background(
            GeometryReader { proxy in
                Color.clear.preference(key: WidthPreference.self, value: proxy.size.width)
            }
        )
    }
}

struct MatchedGeometryEffectTable: View {
    let cells: [[Text]]

    @Namespace var ns

    @State private var width: CGFloat?
    @State private var selectedCell: (row: Int, column: Int)?

    var body: some View {
        VStack {
            ForEach(cells.indices) { row in
                HStack(alignment: .top) {
                    ForEach(cells[row].indices) { column in
                        Button(action: {
                            withAnimation {
                                self.selectedCell = (row: row, column: column)
                            }
                        }, label: {
                            cells[row][column]
                                .foregroundColor(Color.black)
                        })
                        .widthPreference()
                        .frame(width: width, alignment: .topLeading)
                        .matchedGeometryEffect(id: "\(row)_\(column)", in: ns)
                        .overlay(
                            Group {
                                if selectedCell != nil {
                                    Rectangle()
                                        .fill(Color.clear)
                                        .border(Color.accentColor)
                                        .matchedGeometryEffect(id: "\(selectedCell!.0)_\(selectedCell!.1)", in: ns, isSource: false)
                                }
                            }
                        )
                    }
                }
            }
        }
        .onPreferenceChange(WidthPreference.self) { self.width = $0 }
    }
}
