//
//  PokemonAPI.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import Foundation

struct PokemonAPI : PokemonAPIProtocol {
    let session = URLSession.shared

    private let baseUrl = "https://pokeapi.co/api/v2"

    // 1000件取得している。
    func fetchPokemonList() async throws -> PokemonList {
        guard let url = URL(string: "\(baseUrl)/pokemon/?offset=0&limit=1000") else {
            throw PokemonAPIError.invalidURL
        }
        do {
            let data = try await session.startData(url)
            let decoder = JSONDecoder()
            let pokemon = try decoder.decode(PokemonList.self, from: data)
            return pokemon
        } catch _ as DecodingError {
            throw PokemonAPIError.decodingFailed
        }
    }

    func fetchPokemonDetail(pokemon: Pokemon) async throws -> PokemonDetail {
        guard let url = URL(string: pokemon.url) else {
            throw PokemonAPIError.invalidURL
        }

        do {
            let data = try await session.startData(url)
            let decoder = JSONDecoder()
            let pokemon = try decoder.decode(PokemonDetail.self, from: data)
            return pokemon
        } catch  _ as DecodingError {
            throw PokemonAPIError.decodingFailed
        } 
    }
}

protocol PokemonAPIProtocol {
    func fetchPokemonList() async throws -> PokemonList
    func fetchPokemonDetail(pokemon: Pokemon) async throws -> PokemonDetail
}
