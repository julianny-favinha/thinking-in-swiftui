//
//  ContentView.swift
//  Chapter2
//
//  Created by Julianny Favinha Donda on 14/04/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var remote = Remote()

    var body: some View {
        NavigationView {
            Group {
                switch remote.viewState {
                case .loading:
                     ProgressView()
                case .error(let message):
                     Text(message)
                case .content(let photos):
                    List(photos) { photo in
                        NavigationLink(destination: PhotoView(download_url: photo.download_url, aspectRatio: photo.width / photo.height)) {
                            AuthorView(author: photo.author)
                        }
                    }
                }
            }
            .navigationTitle(Text("Image Fetcher"))
        }
        .onAppear(perform: loadData)
    }

    func loadData() {
        remote.loadData(urlString: "https://picsum.photos/v2/list")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
