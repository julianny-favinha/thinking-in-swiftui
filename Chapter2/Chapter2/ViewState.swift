//
//  ViewState.swift
//  Chapter2
//
//  Created by Julianny Favinha Donda on 14/04/21.
//

import Foundation

enum ViewState<A> {
    case loading
    case content(A)
    case error(String)
}
