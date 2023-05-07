//
//  PokemonDetailViewModel.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/08.
//

import Foundation

class PokemonDetailViewModel: ObservableObject {
    @Published var pokemonDetail: PokemonDetail?
    @Published var errorMessage: String = ""

    private let pokemonAPI: PokemonAPIProtocol

    init(pokemonAPI: PokemonAPIProtocol = MockPokemonAPI()) {
        self.pokemonAPI = pokemonAPI
    }

    func fetchPokemonDetail(pokemon: Pokemon) async {
        do {
            let detail = try await pokemonAPI.fetchPokemonDetail(pokemon: pokemon)
            pokemonDetail = detail
        } catch let error as HTTPError {
            errorMessage = error.localizedDescription
        } catch let error as PokemonAPIError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "An unknown error occurred."
        }
    }
}



