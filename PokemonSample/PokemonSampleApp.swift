//
//  PokemonSampleApp.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import SwiftUI

@main
struct PokemonSampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(pokemonListViewModel: PokemonListViewModel())
        }
    }
}
