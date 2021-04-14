//
//  AuthorView.swift
//  Chapter2
//
//  Created by Julianny Favinha Donda on 14/04/21.
//

import Foundation
import SwiftUI

struct AuthorView: View {
    @State var author: String

    var body: some View {
        Text("\(author)")
    }
}
