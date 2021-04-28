//
//  BadgeView.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 22/04/21.
//

import Foundation
import SwiftUI

struct BadgeView: View {
    let count: Int

    var body: some View {
        Group {
            if count != 0 {
                Text("\(count)")
                    .font(.caption)
                    .circle()
            }
        }
    }
}

extension View {
    func badge(count: Int) -> some View {
        self.overlay(
            BadgeView(count: count)
                .alignmentGuide(.trailing, computeValue: {
                    $0[HorizontalAlignment.center]
                })
                .alignmentGuide(.top, computeValue: {
                    $0[HorizontalAlignment.center]
                }),
            alignment: .topTrailing
        )
    }
}
