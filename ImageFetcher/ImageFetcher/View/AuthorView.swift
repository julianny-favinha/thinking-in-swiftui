//
//  AuthorView.swift
//  ImageFetcher
//
//  Created by Julianny Favinha Donda on 04/04/21.
//

import Foundation
import SwiftUI

struct AuthorView: View {
    @State var author: String

    var body: some View {
        VStack {
            Text("\(author)")
        }
    }
}
