//
//  ColorfulSquare.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 22/04/21.
//

import Foundation
import SwiftUI

struct Configuration {
    let size: CGFloat
    let color: Color
}

struct ColorfulSquare: View {
    let config: Configuration

    var body: some View {
        Rectangle()
            .fill(config.color)
            .frame(width: config.size, height: config.size)
    }
}
