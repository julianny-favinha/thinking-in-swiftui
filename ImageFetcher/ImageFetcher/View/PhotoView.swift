//
//  PhotoView.swift
//  ImageFetcher
//
//  Created by Julianny Favinha Donda on 04/04/21.
//

import Foundation
import SwiftUI

struct PhotoView: View {
    let photo: Photo

    @State var image = UIImage()

    var body: some View {
        Image(uiImage: image)
            .resizable()
            .aspectRatio(CGFloat(photo.width / photo.height), contentMode: .fit)
            .cornerRadius(8.0)
            .padding()
            .onAppear(perform: loadData)
    }

    func loadData() {
        guard let url = URL(string: photo.download_url) else {
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
