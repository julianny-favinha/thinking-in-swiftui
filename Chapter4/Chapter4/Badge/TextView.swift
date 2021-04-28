//
//  TextView.swift
//  Chapter4
//
//  Created by Julianny Favinha Donda on 22/04/21.
//

import Foundation
import SwiftUI

struct TextView: View {
    var body: some View {
        VStack(spacing: 40) {
            Text("Hello")
                .padding(10)
                .background(Color.gray)
                .badge(count: 5)

            Text("Hello, World!")
                .padding(10)
                .background(Color.gray)
                .badge(count: 10)

            Text("Hello")
                .padding(10)
                .background(Color.gray)
                .badge(count: 0)
        }
    }
}
