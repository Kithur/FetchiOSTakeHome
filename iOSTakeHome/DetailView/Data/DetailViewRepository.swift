//
//  DetailViewRepository.swift
//  iOSTakeHome
//
//  Created by Luis Roberto Gutiérrez Carbajal on 13/10/23.
//

import Combine

protocol DetailViewRepositoryProtocol {
    func fetchMeal(id: String) -> AnyPublisher<MealDetailModel, Error>
}

// MARK: - DetailViewRepository class
final class DetailViewRepository: DetailViewRepositoryProtocol {
    // MARK: - Properties
    private let serviceManager: APIService

    // MARK: - Initializers
    init(serviceManager: APIService) {
        self.serviceManager = serviceManager
    }

    // MARK: - Methods
    func fetchMeal(id: String) -> AnyPublisher<MealDetailModel, Error> {
        serviceManager
            .fetch(from: .id(id), decodedType: ResultMealDetailContainer.self).map({ MealDetailModel(resultMealDetail: $0.meals[Int.zero]) })
            .mapError({ $0 as Error })
            .eraseToAnyPublisher()
    }
}
