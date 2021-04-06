//
//  ContentView.swift
//  ThinkingInSwiftUI
//
//  Created by Julianny Favinha Donda on 01/04/21.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @ObservedObject var remote = Remote()

    var body: some View {
        NavigationView {
            Group {
                if remote.photos == nil {
                    ProgressView()
                } else {
                    List {
                        ForEach(remote.photos ?? [], id: \.id) { photo in
                            NavigationLink(destination: PhotoView(download_url: photo.download_url, aspectRatio: photo.width / photo.height), label: {
                                AuthorView(author: photo.author)
                            })
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
