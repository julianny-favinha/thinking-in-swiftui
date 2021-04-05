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
            List {
                ForEach(remote.photos ?? [], id: \.id) { photo in
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
        remote.loadData(urlString: "https://picsum.photos/v2/list")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
