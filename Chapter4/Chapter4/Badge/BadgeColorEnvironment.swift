//
//  BadgeColorEnvironment.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 28/04/21.
//

import Foundation
import SwiftUI

fileprivate struct BadgeColorKey: EnvironmentKey {
    static let defaultValue: Color = .purple
}

extension EnvironmentValues {
    var badgeColor: Color {
        get { self[BadgeColorKey.self] }
        set { self[BadgeColorKey.self] = newValue }
    }
}

extension View {
    func badgeColor(_ color: Color) -> some View {
        self.environment(\.badgeColor, color)
    }
}
