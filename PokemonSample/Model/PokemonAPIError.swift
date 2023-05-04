//
//  PokemonAPIError.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/05.
//

import Foundation

enum PokemonAPIError: Error {
    case invalidURL
    case decodingFailed
    case networkError(Error)
}
