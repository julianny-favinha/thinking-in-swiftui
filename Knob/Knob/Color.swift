//
//  ColorKey.swift
//  Knob
//
//  Created by Julianny Favinha Donda on 11/04/21.
//  Copyright © 2021 Chris Eidhof. All rights reserved.
//

import Foundation
import SwiftUI

struct ColorKey: EnvironmentKey {
    static let defaultValue: Color = .pink
}

extension EnvironmentValues {
    var knobColor: Color {
        get { self[ColorKey.self] }
        set { self[ColorKey.self] = newValue }
    }
}

extension View {
    func knobColor(_ color: Color) -> some View {
        self.environment(\.knobColor, color)
    }
}
