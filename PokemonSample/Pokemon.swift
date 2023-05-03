//
//  Pokemon.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/04.
//

import Foundation

struct PokemonList: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
    
}

struct Pokemon: Codable {
    let name: String
    let url: String
}


struct PokemonAPI {
    static func fetchPokemon() async throws -> PokemonList {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon/?offset=0&limit=1000") else {
            throw NSError(domain: "", code: 400, userInfo: nil)
        }
        let session = URLSession.shared
        do {
            let (data, _) = try await session.data(from: url)
            let decoder = JSONDecoder()
            let pokemon = try decoder.decode(PokemonList.self, from: data)
            return pokemon
        } catch {
            throw error
        }
    }
    static func convertDetailDate(id: Pokemon) {
        guard let url = URL(string: "\(id.url)") else { return }
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let pokemon = try JSONDecoder().decode(PokemonDetail.self, from: data)
                print(pokemon)
            } catch let error {
                print(error)
            }
        }
        task.resume()

    }
}
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

