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
            // バックスレッドで処理して、
            let list = try await pokemonAPI.fetchPokemonList()
            // メインスレッドで、Publishedを書き換える。
            DispatchQueue.main.async {
                self.pokemonList = list
            }
        } catch let error as HTTPError {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        } catch let error as PokemonAPIError {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "An unknown error occurred."
            }
        }
    }
}
