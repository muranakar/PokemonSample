//
//  ContentView.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var pokemonListViewModel: PokemonListViewModel

    init(pokemonListViewModel: PokemonListViewModel) {
        self.pokemonListViewModel = pokemonListViewModel
    }

    var body: some View {
        NavigationView {
            VStack {
                if let pokemonList = pokemonListViewModel.pokemonList {
                    List(pokemonList.results , id: \.name) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            Text(pokemon.name)
                        }
                    }
                    .navigationBarTitle("Pokemon List")
                } else if let errorMessage = pokemonListViewModel.errorMessage {
                    Text(errorMessage)
                } else {

                }

            }
            .task {
                await pokemonListViewModel.fetchPokemonList()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(pokemonListViewModel: PokemonListViewModel(pokemonAPI: PokemonAPI()))
    }
}
