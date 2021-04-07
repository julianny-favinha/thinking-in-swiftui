//
//  ViewState.swift
//  ImageFetcher
//
//  Created by Julianny Favinha Donda on 07/04/21.
//

import Foundation

enum ViewState {
    case loading
    case content([Photo])
    case error(String)
}

extension ViewState: Equatable {
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.content(let lhsPhotos), .content(let rhsPhotos)):
            return lhsPhotos == rhsPhotos
        case (.error(let lhsString), .error(let rhsString)):
            return lhsString == rhsString
        default:
            return false
        }
    }
}
