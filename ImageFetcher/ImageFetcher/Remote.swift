//
//  Remote.swift
//  ImageFetcher
//
//  Created by Julianny Favinha Donda on 05/04/21.
//

import Foundation

final class Remote: ObservableObject {
    @Published var photos: [Photo]?

    func loadData(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,
                  let decodedResponse = try? JSONDecoder().decode([Photo].self, from: data) else {
                print("Request failed")
                return
            }

            self?.photos = decodedResponse
        }.resume()
    }
}
