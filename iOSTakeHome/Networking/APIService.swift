//
//  APIService.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 12/10/23.
//

import Foundation
import Combine

enum APIError: Error {
    case apiError(_ description: String)
    case invalidResponse
    case serializationError
    case invalidEndpoint

    var localizedDescription: String {
        switch self {
        case .invalidEndpoint: return "Invalid endpoint"
        case .apiError: return "Failed to fetch data"
        case .invalidResponse: return "Invalid response"
        case .serializationError: return "Failed to decode data"
        }
    }
}

protocol APIService {
    func fetch<T: Decodable>(from mealRequest: MealRequest,
                             decodedType: T.Type) -> AnyPublisher<T, APIError>
}

// MARK: - ServiceManager class
final class ServiceManager: APIService {
    // MARK: - Properties
    private var session: URLSession

    // MARK: - Initializers
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }

    convenience init() {
        self.init(configuration: .default)
    }

    // MARK: - Methods
    func fetch<T>(from mealRequest: MealRequest, decodedType: T.Type) -> AnyPublisher<T, APIError> where T : Decodable {
        guard let finalURL: URL = mealRequest.getFinalURL() else {
            return Fail(error: APIError.invalidEndpoint).eraseToAnyPublisher()
        }
        return session
            .dataTaskPublisher(for: finalURL)
            .receive(on: RunLoop.main)
            .tryMap { data, response -> T in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    throw APIError.invalidResponse
                }
                do {
                    let modelDecoded: T = try JSONDecoder().decode(decodedType, from: data)
                    return modelDecoded
                } catch {
                    throw APIError.serializationError
                }
            }
            .mapError { error in
                APIError.apiError(error.localizedDescription)
            }
            .eraseToAnyPublisher()
    }
}
