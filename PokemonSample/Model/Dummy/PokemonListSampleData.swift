//
//  PokemonListSampleData.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/07.
//

import Foundation

struct PokemonListSampleData {
    let pokemonLists = [
        PokemonList(
            count: 1118,
            next: "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
            previous: nil,
            results: [
                Pokemon(name: "bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/"),
                Pokemon(name: "ivysaur", url: "https://pokeapi.co/api/v2/pokemon/2/"),
                Pokemon(name: "venusaur", url: "https://pokeapi.co/api/v2/pokemon/3/"),
                Pokemon(name: "charmander", url: "https://pokeapi.co/api/v2/pokemon/4/"),
                Pokemon(name: "charmeleon", url: "https://pokeapi.co/api/v2/pokemon/5/"),
                Pokemon(name: "charizard", url: "https://pokeapi.co/api/v2/pokemon/6/"),
                Pokemon(name: "squirtle", url: "https://pokeapi.co/api/v2/pokemon/7/"),
                Pokemon(name: "wartortle", url: "https://pokeapi.co/api/v2/pokemon/8/"),
                Pokemon(name: "blastoise", url: "https://pokeapi.co/api/v2/pokemon/9/"),
                Pokemon(name: "caterpie", url: "https://pokeapi.co/api/v2/pokemon/10/"),
                Pokemon(name: "metapod", url: "https://pokeapi.co/api/v2/pokemon/11/"),
                Pokemon(name: "butterfree", url: "https://pokeapi.co/api/v2/pokemon/12/"),
                Pokemon(name: "weedle", url: "https://pokeapi.co/api/v2/pokemon/13/"),
                Pokemon(name: "kakuna", url: "https://pokeapi.co/api/v2/pokemon/14/"),
                Pokemon(name: "beedrill", url: "https://pokeapi.co/api/v2/pokemon/15/"),
                Pokemon(name: "pidgey", url: "https://pokeapi.co/api/v2/pokemon/16/"),
                Pokemon(name: "pidgeotto", url: "https://pokeapi.co/api/v2/pokemon/17/"),
                Pokemon(name: "pidgeot", url: "https://pokeapi.co/api/v2/pokemon/18/"),
                Pokemon(name: "rattata", url: "https://pokeapi.co/api/v2/pokemon/19/"),
                Pokemon(name: "raticate", url: "https://pokeapi.co/api/v2/pokemon/20/")
            ]
        ),
        PokemonList(
            count: 1118,
            next: nil,
            previous: "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
            results: [
                Pokemon(name: "spearow", url: "https://pokeapi.co/api/v2/pokemon/21/"),
                Pokemon(name: "fearow", url: "https://pokeapi.co/api/v2/pokemon/22/"),
                Pokemon(name: "ekans", url: "https://pokeapi.co/api/v2/pokemon/23/"),
                Pokemon(name: "arbok", url: "https://pokeapi.co/api/v2/pokemon/24/"),
                Pokemon(name: "pikachu",url: "https://pokeapi.co/api/v2/pokemon/25/"),
                Pokemon(name: "raichu", url: "https://pokeapi.co/api/v2/pokemon/26/"),
                Pokemon(name: "sandshrew", url: "https://pokeapi.co/api/v2/pokemon/27/"),
                Pokemon(name: "sandslash", url: "https://pokeapi.co/api/v2/pokemon/28/"),
                Pokemon(name: "nidoran-f", url: "https://pokeapi.co/api/v2/pokemon/29/"),
                Pokemon(name: "nidorina", url: "https://pokeapi.co/api/v2/pokemon/30/"),
                Pokemon(name: "nidoqueen", url: "https://pokeapi.co/api/v2/pokemon/31/"),
                Pokemon(name: "nidoran-m", url: "https://pokeapi.co/api/v2/pokemon/32/"),
                Pokemon(name: "nidorino", url: "https://pokeapi.co/api/v2/pokemon/33/"),
                Pokemon(name: "nidoking", url: "https://pokeapi.co/api/v2/pokemon/34/"),
                Pokemon(name: "clefairy", url: "https://pokeapi.co/api/v2/pokemon/35/"),
                Pokemon(name: "clefable", url: "https://pokeapi.co/api/v2/pokemon/36/"),
                Pokemon(name: "vulpix", url: "https://pokeapi.co/api/v2/pokemon/37/"),
                Pokemon(name: "ninetales", url: "https://pokeapi.co/api/v2/pokemon/38/"),
                Pokemon(name: "jigglypuff", url: "https://pokeapi.co/api/v2/pokemon/39/"),
                Pokemon(name: "wigglytuff", url: "https://pokeapi.co/api/v2/pokemon/40/")
            ]
        )
    ]
}
