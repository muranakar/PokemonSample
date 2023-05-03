//
//  PokemonDetailView.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import SwiftUI

struct PokemonDetailView: View {
    let url: String
    @State private var pokemon: PokemonDetail?
    
    var body: some View {
        VStack {
            if let pokemon = pokemon {
                PokemonImageView(imageUrl: URL(string: pokemon.sprites.frontDefault ?? ""))
                Text("Name: \(pokemon.name)")
                Text("Height: \(pokemon.height)")
                Text("Weight: \(pokemon.weight)")
            } else {
                ProgressView("Loading...")
            }
        }
        .task {
            do {
                let (data, _) = try await URLSession.shared.data(from: URL(string: url)!)
                let pokemon = try JSONDecoder().decode(PokemonDetail.self, from: data)
                self.pokemon = pokemon
            } catch {
                print(error.localizedDescription)
            }
        }
        .navigationBarTitle("Pokemon Detail")
    }
}
struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(url: "")
    }
}
