//
//  PokemonListViewModelTests.swift
//  PokemonSampleTests
//
//  Created by 村中令 on 2023/05/08.
//

import XCTest
@testable import PokemonSample

final class PokemonListViewModelTests: XCTestCase {


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_PokemonListSampleDataを用いて出力の確認() async throws {
        let mockPokemonAPI = MockPokemonAPI()
        let viewModel: PokemonListViewModel = PokemonListViewModel(pokemonAPI: mockPokemonAPI)
        await viewModel.fetchPokemonList()
        XCTAssertEqual(viewModel.pokemonList?.results[0].name, "bulbasaur")
        XCTAssertEqual(viewModel.pokemonList?.results[4].name, "charmeleon")
        XCTAssertEqual(viewModel.pokemonList?.results[10].url, "https://pokeapi.co/api/v2/pokemon/11/")
    }

    @MainActor
    func test_HTTPエラー後エラーメッセージの出力の確認() async throws {
        let viewModel: PokemonListViewModel = PokemonListViewModel(pokemonAPI: MockPokemonAPI(returnHTTPError: .invalidRequest))
        await viewModel.fetchPokemonList()
        XCTContext.runActivity(named: "HTTPErrorに関して") { _ in
            XCTContext.runActivity(named: ".invalidRequestが生じた場合") { _ in
                XCTAssertEqual(viewModel.errorMessage, "DEBUG (invalidRequest): The request could not be made. Please change and try again.")
            }
        }
    }

    @MainActor
    func test_PokemonAPIError後エラーメッセージの出力の確認() async  throws {
        let viewModel: PokemonListViewModel = PokemonListViewModel(pokemonAPI: MockPokemonAPI(returnPokemonAPIError: .decodingFailed))
        await viewModel.fetchPokemonList()
        XCTContext.runActivity(named: "PokemonAPIErrorに関して") { _ in
            XCTContext.runActivity(named: ".decodingFailedが生じた場合") { _ in
                XCTAssertEqual(viewModel.errorMessage, "デコードに失敗しました")
            }
        }
    }
}
