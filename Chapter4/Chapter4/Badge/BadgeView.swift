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

    @Environment(\.badgeColor) var envColor

    var body: some View {
        Group {
            if count != 0 {
                Circle()
                    .fill(envColor)
                    .frame(width: 24, height: 24)
                    .overlay(
                        Text("\(count)")
                            .font(.caption)
                    )
            }
        }
    }
}

extension View {
    func badge(count: Int, alignment: Alignment = .topTrailing) -> some View {
        self.overlay(
            BadgeView(count: count)
                .alignmentGuide(alignment.horizontal, computeValue: {
                    $0[HorizontalAlignment.center]
                })
                .alignmentGuide(alignment.vertical, computeValue: {
                    $0[HorizontalAlignment.center]
                }),
            alignment: alignment
        )
    }
}
