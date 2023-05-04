//
//  PokemonAPI.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import Foundation

struct PokemonAPI {
    let session = URLSession.shared

    let baseUrl = "https://pokeapi.co/api/v2"

    // 1000件取得している。
    func fetchPokemonList() async throws -> PokemonList {
        guard let url = URL(string: "\(baseUrl)/pokemon/?offset=0&limit=1000") else {
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

    func fetchPokemonDetail(pokemon: Pokemon)  async throws  -> PokemonDetail {
        guard let url = URL(string: pokemon.url ) else {
            throw NSError(domain: "", code: 400, userInfo: nil)
        }
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let pokemon = try decoder.decode(PokemonDetail.self, from: data)
            return pokemon
        } catch {
            throw error
        }
    }
}
