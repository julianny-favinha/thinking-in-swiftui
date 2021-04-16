//
//  Remote.swift
//  Chapter2
//
//  Created by Julianny Favinha Donda on 14/04/21.
//

import Foundation

final class Remote<A>: ObservableObject {
    let parse: (Data) -> A
    @Published var viewState: ViewState<A> = .loading

    init(parse: @escaping (Data) -> A) {
        self.parse = parse
    }

    func loadData(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let data = data,
                  let decodedResponse = self?.parse(data) else {

                DispatchQueue.main.async {
                    self?.viewState = .error("Ooops! The request failed. Try again later 😳")
                }
                
                return
            }

            DispatchQueue.main.async {
                self?.viewState = .content(decodedResponse)
            }
        }.resume()
    }
}
