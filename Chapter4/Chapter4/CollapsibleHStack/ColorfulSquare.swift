//
//  ColorfulSquare.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 22/04/21.
//

import Foundation
import SwiftUI

struct ColorfulSquare: View {
    let element: Element

    var body: some View {
        Rectangle()
            .fill(element.color)
            .frame(width: element.size, height: element.size)
    }
}
