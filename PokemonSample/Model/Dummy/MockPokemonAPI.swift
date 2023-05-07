//
//  MockPokemonAPI.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/07.
//

import Foundation

struct MockPokemonAPI : PokemonAPIProtocol {
    let session = URLSession.shared

    private let baseUrl = "https://pokeapi.co/api/v2"

    var returnHTTPError: HTTPError?

    var returnPokemonAPIError: PokemonAPIError?

    let returnMockPokemonList = PokemonListSampleData().pokemonList

    let returnMockPokemonDetail = PokemonDetailSampleData().pokemon

    // 1000件取得している。
    func fetchPokemonList() async throws -> PokemonList {
        if let returnHTTPError {  throw returnHTTPError }
        if let returnPokemonAPIError { throw returnPokemonAPIError }
        return returnMockPokemonList
    }

    func fetchPokemonDetail(pokemon: Pokemon) async throws -> PokemonDetail {
        if let returnHTTPError {  throw returnHTTPError }
        if let returnPokemonAPIError { throw returnPokemonAPIError }
        return returnMockPokemonDetail
    }
}
