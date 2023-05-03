//
//  PokemonList.swift
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
