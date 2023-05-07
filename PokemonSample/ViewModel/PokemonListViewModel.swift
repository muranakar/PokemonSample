//
//  PokemonListViewModel.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/08.
//

import Foundation

class PokemonListViewModel: ObservableObject {
    @Published var pokemonList: PokemonList?
    @Published var errorMessage: String = ""

    private let pokemonAPI: PokemonAPIProtocol

    init(pokemonAPI: PokemonAPIProtocol = MockPokemonAPI()) {
        self.pokemonAPI = pokemonAPI
    }

    func fetchPokemonList() async {
        do {
            let list = try await pokemonAPI.fetchPokemonList()
            pokemonList = list
        } catch let error as HTTPError {
            errorMessage = error.localizedDescription
        } catch let error as PokemonAPIError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "An unknown error occurred."
        }
    }
}
