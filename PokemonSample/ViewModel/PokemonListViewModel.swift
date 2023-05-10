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
            await setPokemonList(pokemonList: list)
        } catch let error as HTTPError {
            await setErrorMessage(errorMessage: error.localizedDescription)
        } catch let error as PokemonAPIError {
            await setErrorMessage(errorMessage: error.localizedDescription)
        } catch {
            await setErrorMessage(errorMessage: "An unknown error occurred.")
        }
    }
    @MainActor private func setPokemonList(pokemonList: PokemonList) {
        self.pokemonList = pokemonList
    }

    @MainActor private func setErrorMessage(errorMessage: String) {
        self.errorMessage = errorMessage
    }
}
