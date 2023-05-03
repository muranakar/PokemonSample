//
//  ContentView.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import SwiftUI

struct ContentView: View {
    @State private var pokemonList: PokemonList?
    private let pokemonAPI = PokemonAPI()
    var body: some View {
        NavigationView {
            VStack {
                if let pokemonList = pokemonList {
                    List(pokemonList.results , id: \.name) { pokemon in
                        NavigationLink(destination: PokemonDetailView(url: pokemon.url)) {
                            Text(pokemon.name)
                        }
                    }
                    .navigationBarTitle("Pokemon List")
                } else {
                    ProgressView("Loading...")
                }
            }
            .task {
                do {
                    self.pokemonList = try await pokemonAPI.fetchPokemon()
                    print(pokemonList)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
