//
//  PointerSize.swift
//  Knob
//
//  Created by Julianny Favinha Donda on 11/04/21.
//  Copyright © 2021 Chris Eidhof. All rights reserved.
//

import Foundation
import SwiftUI

fileprivate struct PointerSizeKey: EnvironmentKey {
    static let defaultValue: CGFloat = 0.1
}

extension EnvironmentValues {
    var knobPointerSize: CGFloat {
        get { self[PointerSizeKey.self] }
        set { self[PointerSizeKey.self] = newValue }
    }
}

extension View {
    func knobPointerSize(_ size: CGFloat) -> some View {
        self.environment(\.knobPointerSize, size)
    }
}
