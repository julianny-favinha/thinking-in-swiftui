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

    @State var image: UIImage?

    var body: some View {
        Group {
            if image == nil {
                ProgressView()
            } else {
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
        guard let url = URL(string: download_url) else {
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let image = UIImage(data: data) else {
                print("Request failed")
                return
            }

            self.image = image
        }.resume()
    }
}
