//
//  View+Circle.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 24/04/21.
//

import Foundation
import SwiftUI

extension View {
    func circle() -> some View {
        Circle()
            .fill(Color.red)
            .overlay(self.foregroundColor(.white))
            .frame(width: 24, height: 24)
    }
}
