//
//  Pokemon.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import Foundation

struct PokemonDetail: Codable {
    let id: Int
    let name: String
    let baseExperience: Int
    let height: Int
    let weight: Int
    let types: [PokemonType]
    let abilities: [Ability]
    let sprites: Sprites
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case baseExperience = "base_experience"
        case height
        case weight
        case types
        case abilities
        case sprites
    }
}

struct PokemonType: Codable {
    let slot: Int
    let type: TypeName
}

struct TypeName: Codable {
    let name: String
}

struct Ability: Codable {
    let slot: Int
    let ability: AbilityName
}

struct AbilityName: Codable {
    let name: String
}

struct Sprites: Codable {
    let frontDefault: String?
    
    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}

