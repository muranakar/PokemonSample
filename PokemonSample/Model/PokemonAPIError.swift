//
//  PokemonAPIError.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/05.
//

import Foundation

enum PokemonAPIError: Error, LocalizedError {
    case invalidURL
    case decodingFailed


    var errorDescription: String? {
        #if DEBUG
        return debugDescription
        #else
        return description
        #endif
    }

    var description: String {
        switch self {
        case .invalidURL:
             return "無効なURLです"
        case .decodingFailed:
            return "デコードに失敗しました"
        }
    }

    var debugDescription: String {
        switch self {
        case .invalidURL:
            return "無効なURLです"
        case .decodingFailed:
            return "デコードに失敗しました"
        }
    }
}
