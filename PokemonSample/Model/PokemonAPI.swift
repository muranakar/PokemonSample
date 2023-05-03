//
//  PokemonAPI.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import Foundation

struct PokemonAPI {
    let session = URLSession.shared

    // 1000件取得している。
    func fetchPokemonList() async throws -> PokemonList {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1000") else {
            throw NSError(domain: "", code: 400, userInfo: nil)
        }

        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let pokemon = try decoder.decode(PokemonList.self, from: data)
            return pokemon
        } catch {
            throw error
        }
    }

    func fetchPokemonDetail(urlString: String) -> PokemonDetail {
        guard let url = URL(string: "\(urlString)") else { return }
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let pokemon = try JSONDecoder().decode(PokemonDetail.self, from: data)
                print(pokemon)
            } catch let error {
                print(error)
            }
        }
        task.resume()
    }
}
