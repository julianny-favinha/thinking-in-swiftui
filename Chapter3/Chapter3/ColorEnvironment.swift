//
//  ColorEnvironment.swift
//  Chapter3
//
//  Created by Julianny Favinha Donda on 14/04/21.
//

import Foundation
import SwiftUI

struct ColorKey: EnvironmentKey {
    static let defaultValue: Color? = nil
}

extension EnvironmentValues {
    var color: Color? {
        get { self[ColorKey.self] }
        set { self[ColorKey].self = newValue }
    }
}

extension View {
    func color(_ color: Color?) -> some View {
        environment(\.color, color)
    }
}
