//
//  Alignment.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 21/04/21.
//

import Foundation
import SwiftUI

enum MyCenterID: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        return context.height / 2
    }
}

extension VerticalAlignment {
    static let myCenter: VerticalAlignment = VerticalAlignment(MyCenterID.self)
}

extension HorizontalAlignment {
    static let myCenter: HorizontalAlignment = HorizontalAlignment(MyCenterID.self)
}

extension Alignment {
    static let myCenter: Alignment = Alignment(horizontal: .myCenter, vertical: .myCenter)
}
