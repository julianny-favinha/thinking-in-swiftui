//
//  Photo.swift
//  ThinkingInSwiftUI
//
//  Created by Julianny Favinha Donda on 04/04/21.
//

import Foundation

struct Photo: Identifiable, Codable, Equatable {
    let id: String
    let author: String
    let width: Float
    let height: Float
    let url: String
    let download_url: String
}
