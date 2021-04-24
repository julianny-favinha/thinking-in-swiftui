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
        if count == 0 {
            Text("\(count)")
                .font(.caption)
                .circle()
                .hidden()
        } else {
            Text("\(count)")
                .font(.caption)
                .circle()
        }
    }
}

extension View {
    func badge(count: Int) -> some View {
        self.overlay(
            BadgeView(count: count)
                .offset(x: 30, y: -20)
        )
    }
}
