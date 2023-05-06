//
//  PokemonDetailSampleData.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/07.
//

import Foundation

struct PokemonDetailSampleData {
    let pokemons = [
        PokemonDetail(
            id: 25,
            name: "Pikachu",
            baseExperience: 112,
            height: 4,
            weight: 60,
            types: [
                PokemonType(slot: 1, type: TypeName(name: "Electric"))
            ],
            abilities: [
                Ability(slot: 1, ability: AbilityName(name: "Static"))
            ],
            sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/25.png")
        ),
        PokemonDetail(
            id: 6,
            name: "Charizard",
            baseExperience: 240,
            height: 17,
            weight: 905,
            types: [
                PokemonType(slot: 1, type: TypeName(name: "Fire")),
                PokemonType(slot: 2, type: TypeName(name: "Flying"))
            ],
            abilities: [
                Ability(slot: 1, ability: AbilityName(name: "Blaze")),
                Ability(slot: 3, ability: AbilityName(name: "Solar Power"))
            ],
            sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/6.png")
        ),
        PokemonDetail(
            id: 143,
            name: "Snorlax",
            baseExperience: 189,
            height: 21,
            weight: 4600,
            types: [
                PokemonType(slot: 1, type: TypeName(name: "Normal"))
            ],
            abilities: [
                Ability(slot: 1, ability: AbilityName(name: "Immunity")),
                Ability(slot: 2, ability: AbilityName(name: "Thick Fat"))
            ],
            sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/143.png")
        ),
        PokemonDetail(
            id: 149,
            name: "Dragonite",
            baseExperience: 270,
            height: 22,
            weight: 2100,
            types: [
                PokemonType(slot: 1, type: TypeName(name: "Dragon")),
                PokemonType(slot: 2, type: TypeName(name: "Flying"))
            ],
            abilities: [
                Ability(slot: 1, ability: AbilityName(name: "Inner Focus")),
                Ability(slot: 2, ability: AbilityName(name: "Multiscale"))
            ],
            sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/149.png")
        ),
        PokemonDetail(
            id: 245,
            name: "Suicune",
            baseExperience: 261,
            height: 20,
            weight: 1870,
            types: [
                PokemonType(slot: 1, type: TypeName(name: "Water"))
            ],
            abilities: [
                Ability(slot: 1, ability: AbilityName(name: "Pressure")),
                Ability(slot: 2, ability: AbilityName(name: "Water Absorb"))
            ],
            sprites: Sprites(frontDefault: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/245.png")
        )
    ]

}
