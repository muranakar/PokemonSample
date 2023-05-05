//
//  PokemonDetailView.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import SwiftUI

struct PokemonDetailView: View {
    let pokemon: Pokemon
    @State var pokemonDetail: PokemonDetail?
    @State var errorText: String?
    let pokemonAPI = PokemonAPI()
    
    var body: some View {
        VStack {
            if let pokemonDetail = pokemonDetail {
                PokemonImageView(imageUrl: URL(string: pokemonDetail.sprites.frontDefault ?? ""))
                Text("Name: \(pokemonDetail.name)")
                Text("Height: \(pokemonDetail.height)")
                Text("Weight: \(pokemonDetail.weight)")
            } else if let errorText {
                Text(errorText)
            } else {
                ProgressView("Loading...")
            }
        }
        .task {
            do {
                pokemonDetail = try await pokemonAPI.fetchPokemonDetail(pokemon: pokemon)
            } catch {
                errorText = error.localizedDescription
                print(error.localizedDescription)
            }
        }
        .navigationBarTitle("Pokemon Detail")
    }
}
struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(
            pokemon:Pokemon(name: "",url: "")
        )
    }
}
