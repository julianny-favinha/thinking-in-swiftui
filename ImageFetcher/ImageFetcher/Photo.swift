//
//  Photo.swift
//  ThinkingInSwiftUI
//
//  Created by Julianny Favinha Donda on 04/04/21.
//

import Foundation

struct Photo: Codable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let download_url: String
}
