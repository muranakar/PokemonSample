//
//  PokemonAPI.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import Foundation

struct PokemonAPI {
    static func fetchPokemon() async throws -> PokemonList {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1000") else {
            throw NSError(domain: "", code: 400, userInfo: nil)
        }
        let session = URLSession.shared
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let pokemon = try decoder.decode(PokemonList.self, from: data)
            return pokemon
        } catch {
            throw error
        }
    }
    static func convertDetailDate(id: Pokemon) {
        guard let url = URL(string: "\(id.url)") else { return }
        let session = URLSession.shared
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
