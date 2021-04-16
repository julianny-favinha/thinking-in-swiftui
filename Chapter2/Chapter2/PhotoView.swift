//
//  PhotoView.swift
//  Chapter2
//
//  Created by Julianny Favinha Donda on 14/04/21.
//

import Foundation
import SwiftUI

struct PhotoView: View {
    let download_url: String
    let aspectRatio: Float

    @ObservedObject var remote = Remote<UIImage?>(parse: { data in
        UIImage(data: data)
    })

    var body: some View {
        Group {
            switch remote.viewState {
            case .loading:
                 ProgressView()

            case .error(let message):
                 Text(message)
                    .padding()

            case .content(let image):
                Image(uiImage: image ?? UIImage())
                    .resizable()
                    .aspectRatio(CGFloat(aspectRatio), contentMode: .fit)
                    .cornerRadius(8.0)
                    .padding()
            }
        }
        .onAppear(perform: loadData)
    }

    func loadData() {
        remote.loadData(urlString: download_url)
    }
}
