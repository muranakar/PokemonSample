//
//  URLSession+Request.swift
//  PokemonSample
//
//  Created by 村中令 on 2023/05/05.
//

import Foundation

extension URLSession {
    /**
     Starts the URLRequest and returns the response from the server or an error.

     - parameter request: The URLRequest
     - parameter completion: Returns the web service response and error

        `result`: Success returns the resulting Data, or Failure returns an error. The error is nil unless:
         - the URLSession fails
         - the web service returns an error status code
         - Error with type httpError
     */
    func startData(_ request: URLRequest, completion: @escaping (_ result: Result<Data, Error>) -> Void) {
        self.dataTask(with: request) { data, response, error in
            if let response = response as? HTTPURLResponse {
                let status = HTTPStatus(code: response.statusCode)

                if status == .unauthorized {
                    completion(.failure(HTTPError.unauthorized))
                }
                else if status.category == .success,
                    let data = data {
                    completion(.success(data))
                }
                else {
                    completion(.failure(HTTPError.serverResponse(status, data)))
                }
            }
            else if let error = error {
                if let nsError = error as NSError?,
                    nsError.code == HTTPError.noNetwork.code {
                    completion(.failure(HTTPError.noNetwork))
                }
                else if let nsError = error as NSError?,
                    nsError.code == HTTPError.timeout.code {
                    completion(.failure(HTTPError.timeout))
                }
                else if let httpError = error as? HTTPError {
                    completion(.failure(httpError))
                }
                else {
                    completion(.failure(HTTPError.other(error)))
                }
            }
            else {
                completion(.failure(HTTPError.httpError))
            }
        }.resume()
    }


    /**
     Starts the URLRequest and returns the response from the server or an error.

     - parameter request: The URLRequest
     - returns: Returns the web service response or throws an HTTPError
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    func startData(_ url: URL) async throws -> Data {
        do {
            let (data, response) = try await self.data(from: url)

            if let response = response as? HTTPURLResponse {
                let status = HTTPStatus(code: response.statusCode)

                if status == .unauthorized {
                    throw HTTPError.unauthorized
                }
                else if status.category == .success {
                    return data
                }
                else {
                    throw HTTPError.serverResponse(status, data)
                }
            }
            else {
                throw HTTPError.httpError
            }
        }
        catch {
            if let nsError = error as NSError?,
                nsError.code == HTTPError.noNetwork.code {
                throw HTTPError.noNetwork
            }
            else if let nsError = error as NSError?,
                nsError.code == HTTPError.timeout.code {
                throw HTTPError.timeout
            }
            else if let httpError = error as? HTTPError {
                throw httpError
            }
            else {
                throw HTTPError.other(error)
            }
        }
    }
}
