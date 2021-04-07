//
//  Remote.swift
//  ImageFetcher
//
//  Created by Julianny Favinha Donda on 05/04/21.
//

import Foundation

final class Remote: ObservableObject {
    @Published var viewState: ViewState = .loading

    func loadData(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,
                  let decodedResponse = try? JSONDecoder().decode([Photo].self, from: data) else {
                self?.viewState = .error("Ooops! The request failed. Try again later 😳")
                return
            }

            // publishing changes from background threads. FIX IT :D
            self?.viewState = .content(decodedResponse)
        }.resume()
    }
}
