//
//  ContentView.swift
//  ThinkingInSwiftUI
//
//  Created by Julianny Favinha Donda on 01/04/21.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @State private var photos: [Photo] = []

    var body: some View {
        NavigationView {
            List {
                ForEach(photos, id: \.id) { photo in
                    NavigationLink(destination: PhotoView(photo: photo), label: {
                        AuthorView(author: photo.author)
                    })
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle(Text("Image Fetcher"))
        }
    }

    func loadData() {
        guard let url = URL(string: "https://picsum.photos/v2/list") else {
            print("Invalid URL")
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                  let decodedResponse = try? JSONDecoder().decode([Photo].self, from: data) else {
                print("Request failed")
                return
            }

            self.photos = decodedResponse
        }.resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
